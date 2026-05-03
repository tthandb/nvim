---
name: Neovim config project context
description: Key decisions, fixes, and architecture facts for the nvim dotfiles config
type: project
---

Dotfiles nvim config at `~/dotfiles/.config/nvim`, symlinked to `~/.config/nvim`. Uses lazy.nvim as plugin manager.

## Completed work in this session (2026-03-15)

### Cleanup applied
- Removed `on_attach = on_attach` from all lspconfig setups (was undefined — caused runtime errors on LSP attach). LSP keymaps (`gd`, `gr`, `K`, etc.) are globally registered via telescope.lua `keys`, so no on_attach is needed.
- Removed `nvimtools/none-ls.nvim` + `jay-babu/mason-null-ls.nvim` entirely — redundant with conform.nvim + nvim-lint stack.
- Removed `pyright` from LSP servers — user does not use Python in Neovim.
- Removed all commented Python lines (isort, black, pylint) from formatting.lua, lint.lua, lsp.lua.
- Fixed `vim.loop.fs_stat` → `vim.uv.fs_stat` in init.lua (vim.loop is deprecated).
- Removed `"toggleterm"` from lualine extensions — toggleterm is not installed.
- Renamed `"tsserver"` → `"ts_ls"` in lsp.lua (nvim-lspconfig renamed the server).

### Treesitter v1.x migration
nvim-treesitter updated to v1.x which **removed `nvim-treesitter.configs` entirely**. Migrated treesitter.lua:
- Parser install: `require("nvim-treesitter").install({...})` (async, called in config)
- Highlighting: FileType autocmd calling `pcall(vim.treesitter.start, buf)`
- Textobjects: Fully manual `vim.keymap.set` calls via `nvim-treesitter-textobjects.select/swap/move` modules
- `builtin_f/F/t/T` → `builtin_f_expr` etc. with `{ expr = true }` (new repeatable_move API)
- nvim-treesitter-textobjects.setup() now only accepts `select` and `move` behavior config — no keymaps in setup

### install.sh rewrite
Rewrote from Linux-only apt script to macOS + Linux script:
- macOS: installs/checks Homebrew, then `brew install neovim ripgrep fd gcc node unzip git`
- Linux: apt for deps + NodeSource LTS for node + AppImage for nvim (x86_64 or aarch64)
- Idempotent: skips already-installed tools
- Mason handles all LSP/formatter/linter installation on first nvim launch

## Architecture facts
- **LSP keymaps in telescope.lua** — `gd`, `gr`, `gD`, `gI`, `gy`, `K`, `gK`, `<leader>gf`, `<leader>ga` are lazy `keys` on the telescope plugin, not in on_attach
- **No format-on-save** — user prefers manual `<leader>mp`
- **Formatters**: conform.nvim (prettier for web, stylua for lua)
- **Linters**: nvim-lint (eslint_d for JS/TS/Svelte)
- **bufferline in tabs mode** — shows vim tabs, not open buffers
- **CLAUDE.md created** at root of nvim config for future sessions
