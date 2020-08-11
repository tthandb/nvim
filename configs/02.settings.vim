let mapleader = "\<Space>"
filetype plugin on
filetype plugin indent on
autocmd BufEnter * :set scroll=10
syntax on

set encoding=UTF-8
set mouse=a

set incsearch
set hlsearch

set number
set tabstop=4
set softtabstop=0
set shiftwidth=4

set encoding=UTF-8
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

"Mappings to move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" use alt+hjkl to move between split/vsplit panels
"tnoremap <A-h> <C-\><C-n><C-w>h
"tnoremap <A-j> <C-\><C-n><C-w>j
"tnoremap <A-k> <C-\><C-n><C-w>k
"tnoremap <A-l> <C-\><C-n><C-w>l
"nnoremap <A-h> <C-w>h
"nnoremap <A-j> <C-w>j
"nnoremap <A-k> <C-w>k
"nnoremap <A-l> <C-w>l
