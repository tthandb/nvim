# My Neovim Configuration

A modern and feature-rich Neovim setup focused on productivity and aesthetics.

## Features

- 🚀 Fast startup with lazy loading via [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🧠 Intelligent code completion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- 🔍 Fuzzy finding with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- 🌳 Syntax highlighting with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- 🧰 LSP support with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- 📁 File explorer with [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- 🔄 Git integration with [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) and [neogit](https://github.com/TimUntersberger/neogit)
- 📊 Beautiful statusline with [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- 🖌️ Tokyo Night theme with [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- 🏄 Fast navigation with [leap.nvim](https://github.com/ggandor/leap.nvim) and [harpoon](https://github.com/ThePrimeagen/harpoon)
- 💾 Session management with [auto-session](https://github.com/rmagatti/auto-session)
- 🔧 Auto formatting with [conform.nvim](https://github.com/stevearc/conform.nvim)
- 👨‍💻 Linting with [nvim-lint](https://github.com/mfussenegger/nvim-lint)

## Installation

1. Make sure you have Neovim 0.9+ installed
2. Clone this repository:
   ```
   git clone https://github.com/tthandb/nvim.git ~/.config/nvim
   ```
3. Run the installation script to install necessary dependencies:
   ```
   cd ~/.config/nvim
   ./install.sh
   ```
4. Start Neovim and let lazy.nvim install all plugins:
   ```
   nvim
   ```

## Key Plugins

- **lazy.nvim**: Plugin manager
- **nvim-lspconfig**: Language Server Protocol support
- **mason.nvim**: LSP/DAP/linter manager
- **nvim-cmp**: Completion engine with LuaSnip integration
- **telescope.nvim**: Fuzzy finder and picker
- **neo-tree.nvim**: File explorer
- **tokyonight.nvim**: Color scheme
- **treesj**: Code block splitting/joining
- **which-key.nvim**: Keybinding helper
- **gitsigns.nvim** & **neogit**: Git integration
- **nvim-treesitter**: Better syntax highlighting
- **bufferline.nvim**: Buffer tabs
- **nvim-autopairs**: Auto-closing brackets
- **harpoon**: File bookmarking
- **leap.nvim** & **flit.nvim**: Fast navigation

## Customization

Edit files in the `lua` directory to customize your configuration:
- `init.lua`: Main configuration file
- `plugins.lua`: Plugin specifications 
- `keymaps.lua`: Custom keybindings
- `options.lua`: Neovim options

## License

MIT
