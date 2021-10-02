local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

  -- Intellisense
	use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'

  -- Snippets
	use 'hrsh7th/vim-vsnip'
  
  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  
  -- Explorer
	use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
	}

  -- Optimize motions
	use 'unblevable/quick-scope'
	-- use 'justinmk/vim-sneak'

  -- Comment
	use 'b3nj5m1n/kommentary'

  -- Auto pair
  use 'jiangmiao/auto-pairs'

  -- Colorschemes
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'christianchiarulli/nvcode-color-schemes.vim'

  -- Color parentheses
  use 'luochen1990/rainbow'

  -- Visualize git status
  use 'airblade/vim-gitgutter'

end)

