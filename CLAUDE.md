# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Setup

Run `./install.sh` to install system dependencies (nvim, node, ripgrep, fd, gcc). Supports macOS (Homebrew) and Linux (apt). On first `nvim` launch, lazy.nvim bootstraps itself and installs all plugins automatically. Mason then auto-installs LSP servers and tools.

## Architecture

### Entry point
`init.lua` — guards against VSCode/Cursor by checking `vim.g.vscode` before loading core and plugins. Bootstraps lazy.nvim, then calls `require("lazy").setup("plugins")` which auto-discovers every file in `lua/plugins/`.

### Config layers
- `lua/core/options.lua` — vim options and globals (leader = Space, 2-space indent)
- `lua/core/keymaps.lua` — base keymaps only (`jk`/`kj` escape, `<C-hjkl>` window nav, `<M-j/k>` line move)
- `lua/plugins/*.lua` — one file per feature area; each returns a lazy.nvim plugin spec table

### Plugin file responsibilities
| File | Owns |
|---|---|
| `lsp.lua` | nvim-lspconfig + mason + mason-lspconfig + mason-tool-installer |
| `cmp.lua` | nvim-cmp completion engine + LuaSnip + cmp sources |
| `treesitter.lua` | nvim-treesitter (v1.x API) |
| `telescope.lua` | telescope + all LSP keymaps (`gd`, `gr`, `K`, etc.) |
| `editor.lua` | autopairs, Comment.nvim, surround |
| `formatting.lua` | conform.nvim (prettier, stylua) |
| `lint.lua` | nvim-lint (eslint_d) |
| `git.lua` | gitsigns |
| `ui.lua` | which-key, bufferline, lualine, scrollbar, rainbow-delimiters, indent-blankline |
| `neo-tree.lua` | file/buffer/git explorer |
| `colorscheme.lua` | tokyonight |

### LSP servers (auto-installed via Mason)
`ts_ls`, `lua_ls`

### Formatters / linters (auto-installed via Mason)
prettier, stylua, eslint_d — managed by mason-tool-installer, run by conform.nvim and nvim-lint respectively.

### nvim-treesitter v1.x notes
The v1.x API removed `nvim-treesitter.configs`. Parser installation uses `require("nvim-treesitter").install({...})`. Highlighting is enabled per-buffer via `vim.treesitter.start(buf)` in a FileType autocmd.

### Key design decisions
- **LSP keymaps live in `telescope.lua`** (as lazy `keys`), not in an `on_attach`. They are globally registered.
- **No format-on-save** — formatting is manual via `<leader>mp` (conform.nvim).
- **bufferline in `tabs` mode** — shows vim tabs, not open buffers.
- **VSCode/Cursor compatibility** — `lua/cursor-ai/init.lua` exists; `init.lua` skips core/plugins when `vim.g.vscode` is set.

## Key mappings reference

| Key | Action |
|---|---|
| `<leader>fn` | Find files (telescope) |
| `<leader>fg` | Live grep |
| `<leader>mp` | Format file (conform) |
| `<leader>l` | Trigger lint |
| `<leader>gj` `gk` `gp` `gs` `gr` `gd` `gl` | gitsigns: hunks/preview/stage/reset/diff/blame |
| `<C-b>` | Toggle neo-tree |
| `gd` `gr` `K` `gK` `<leader>ga` | LSP: definition, references, hover, signature, code action |
