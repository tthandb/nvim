local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
	-- Foundation
	use 'wbthomason/packer.nvim'

  -- Intellisense
	use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'

  -- Prettier
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  -- Tabline
  use 'akinsho/bufferline.nvim'

  -- Snippets
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  
  -- Fuzzy finder
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim' 

  -- Surround
  use 'tpope/vim-surround'
  
  -- Explorer
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'

  -- Optimize motions
	use 'unblevable/quick-scope'
	use 'justinmk/vim-sneak'

  -- Comment
  use 'numToStr/Comment.nvim' -- Easily comment stuff


  -- Auto pair
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Colorschemes
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'folke/tokyonight.nvim'

  -- Color parentheses
  use 'luochen1990/rainbow'

  -- Indent guidelines
  use 'lukas-reineke/indent-blankline.nvim'


  -- Git decorations
  use {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
  end
}


end)

