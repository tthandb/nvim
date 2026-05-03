#!/usr/bin/env bash
set -e

# ─────────────────────────────────────────────
# Neovim config installer — macOS & Linux only
# ─────────────────────────────────────────────

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'
info()    { echo -e "${CYAN}[info]${NC}  $*"; }
success() { echo -e "${GREEN}[ok]${NC}    $*"; }
warn()    { echo -e "${YELLOW}[warn]${NC}  $*"; }
die()     { echo -e "${RED}[error]${NC} $*" >&2; exit 1; }

# ── OS detection ─────────────────────────────

OS="$(uname -s)"
ARCH="$(uname -m)"

case "$OS" in
  Darwin) PLATFORM="macos" ;;
  Linux)  PLATFORM="linux" ;;
  *)      die "Unsupported OS: $OS" ;;
esac

info "Platform: $PLATFORM ($ARCH)"

# ── Helpers ──────────────────────────────────

has() { command -v "$1" &>/dev/null; }

# ── macOS: ensure Homebrew ────────────────────

if [[ "$PLATFORM" == "macos" ]]; then
  if ! has brew; then
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add brew to PATH for the rest of this script
    if [[ "$ARCH" == "arm64" ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    else
      eval "$(/usr/local/bin/brew shellenv)"
    fi
  else
    success "Homebrew already installed"
  fi
fi

# ── Package installers ────────────────────────

install_macos() {
  local pkg="$1"
  local check="${2:-$1}"   # optional: command to check instead of package name
  if has "$check"; then
    success "$pkg already installed"
  else
    info "Installing $pkg..."
    brew install "$pkg"
  fi
}

install_linux() {
  local pkg="$1"
  local check="${2:-$1}"
  if has "$check"; then
    success "$pkg already installed"
  else
    info "Installing $pkg..."
    sudo apt-get install -y "$pkg"
  fi
}

# ── Install Neovim ────────────────────────────

install_nvim_macos() {
  if has nvim; then
    success "nvim already installed ($(nvim --version | head -1))"
  else
    info "Installing neovim via Homebrew..."
    brew install neovim
  fi
}

install_nvim_linux() {
  if has nvim; then
    success "nvim already installed ($(nvim --version | head -1))"
    return
  fi

  info "Installing neovim (AppImage)..."
  local tmp
  tmp="$(mktemp -d)"

  case "$ARCH" in
    x86_64)  local appimage="nvim-linux-x86_64.appimage" ;;
    aarch64) local appimage="nvim-linux-arm64.appimage" ;;
    *)       die "Unsupported Linux architecture: $ARCH" ;;
  esac

  curl -sSLo "$tmp/$appimage" \
    "https://github.com/neovim/neovim/releases/latest/download/$appimage"
  chmod u+x "$tmp/$appimage"
  sudo mv "$tmp/$appimage" /usr/local/bin/nvim
  rm -rf "$tmp"
  success "nvim installed to /usr/local/bin/nvim"
}

# ── Main ──────────────────────────────────────

if [[ "$PLATFORM" == "macos" ]]; then
  # ── Neovim
  install_nvim_macos

  # ── System dependencies
  install_macos "gcc"
  install_macos "git"
  install_macos "ripgrep" "rg"
  install_macos "fd"
  install_macos "unzip"
  install_macos "node"
  install_macos "tree-sitter-cli" "tree-sitter"

else
  # ── Update apt once
  info "Updating apt..."
  sudo apt-get update -qq

  # ── System dependencies
  install_linux "git"
  install_linux "gcc"
  install_linux "ripgrep" "rg"
  install_linux "fd-find" "fdfind"
  install_linux "unzip"
  install_linux "curl"

  # ── Node.js (needed by Mason for most LSP servers / formatters)
  if has node; then
    success "node already installed ($(node --version))"
  else
    info "Installing Node.js via NodeSource (LTS)..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
  fi

  # ── Neovim
  install_nvim_linux

  # ── Make fd available as 'fd' (Ubuntu names it 'fdfind')
  if has fdfind && ! has fd; then
    info "Symlinking fdfind → fd..."
    sudo ln -sf "$(command -v fdfind)" /usr/local/bin/fd
  fi

  # ── tree-sitter CLI (required by nvim-treesitter v1.x to compile parsers)
  if has tree-sitter; then
    success "tree-sitter already installed"
  else
    info "Installing tree-sitter CLI via npm..."
    sudo npm install -g tree-sitter-cli
  fi
fi

# ── Verify ────────────────────────────────────

echo ""
info "Checking installed tools..."
for tool in nvim node npm git rg fd gcc tree-sitter; do
  if has "$tool"; then
    success "$tool  →  $(command -v $tool)"
  else
    warn "$tool not found"
  fi
done

echo ""
success "Done! Open nvim and run :Lazy sync to install plugins."
info  "Mason will auto-install LSP servers (tsserver, lua_ls, tailwindcss, etc.)"
info  "and tools (prettier, stylua, eslint_d) on first launch."
