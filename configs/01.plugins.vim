call plug#begin('~/.config/nvim/bundle')
Plug 'scrooloose/nerdtree' 
Plug 'morhetz/gruvbox' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland /typescript-vim'
Plug 'peitalin/vim-jsx-typescript' 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'townk/vim-autoclose'
Plug 'prettier/vim-prettier', { 'do': 'yarn install'}
call plug#end()
