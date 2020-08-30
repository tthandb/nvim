call plug#begin('~/.config/nvim/bundle')
Plug 'scrooloose/nerdtree' 
"Colorschemes
Plug 'morhetz/gruvbox' 
Plugin 'sonph/onehalf', {'rtp': 'vim/'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript' 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'alvan/vim-closetag'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'

"snippet
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
call plug#end()
