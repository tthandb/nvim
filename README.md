# Neovim config

Personal Neovim setup, slimmed down to what I actually use.

## Features

- Lazy plugin loading via [lazy.nvim](https://github.com/folke/lazy.nvim)
- LSP via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + [mason.nvim](https://github.com/williamboman/mason.nvim) (`ts_ls`, `lua_ls`)
- Completion via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- Syntax via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Fuzzy finder: [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- File explorer: [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- Git inline: [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- Statusline / tabs: [lualine](https://github.com/nvim-lualine/lualine.nvim) + [bufferline](https://github.com/akinsho/bufferline.nvim)
- Theme: [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- Formatting: [conform.nvim](https://github.com/stevearc/conform.nvim) (prettier, stylua)
- Linting: [nvim-lint](https://github.com/mfussenegger/nvim-lint) (eslint_d)

## Install

Requires Neovim 0.10+.

```sh
git clone https://github.com/tthandb/nvim.git ~/.config/nvim
cd ~/.config/nvim && ./install.sh
nvim   # lazy.nvim + Mason auto-install on first launch
```

## Layout

```
init.lua                   # entrypoint, bootstraps lazy.nvim
lua/core/options.lua       # vim options
lua/core/keymaps.lua       # base keymaps (jk-Esc, window nav, line move)
lua/plugins/*.lua          # one file per feature area
```

See [CLAUDE.md](./CLAUDE.md) for the architecture reference.

## License

MIT
