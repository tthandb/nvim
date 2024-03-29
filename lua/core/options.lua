vim.g.mapleader = " "

-- line numbers
vim.o.relativenumber = true
vim.o.number = true

-- split windows
vim.o.splitbelow = true -- split horizontal window to the bottom
vim.o.splitright = true -- split vertical window to the right

vim.o.hidden = true -- Required to keep multiple buffers open multiple buffers
vim.o.wrap = false -- Display long lines as just one line
vim.o.encoding = "utf-8" -- The encoding displayed
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.ruler = true -- Show the cursor position all the time
vim.o.cmdheight = 2 -- More space for displaying messages
vim.o.mouse = "a" -- Enable your mouse

vim.o.conceallevel = 0 -- So that I can see `` in markdown files

-- tab and indent
vim.o.tabstop = 2 -- Insert 2 spaces for a tab
vim.o.shiftwidth = 2 -- Change the number of space characters inserted for indentation
vim.o.smarttab = true -- Makes tabbing smarter will realize you have 2 vs 4
vim.o.expandtab = true -- Converts tabs to spaces
vim.o.smartindent = true -- Makes indenting smart
vim.o.autoindent = true -- Good auto indent

vim.o.laststatus = 2 -- Always display the status line
vim.o.cursorline = true -- Enable highlighting of the current line
vim.o.background = "dark" -- tell vim what the background color looks like
vim.o.showtabline = 2 -- Always show tabs
vim.o.updatetime = 300 -- Faster completion
vim.o.timeoutlen = 500 -- By default timeoutlen is 1000 ms
vim.opt.termguicolors = true

-- fold setting
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 99

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_command([[
  set t_Co=256                            " Support 256 colors
  au FileType * set fo-=c fo-=r fo-=o    " Stop newline continution of comments
]])

vim.cmd([[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
  augroup END
]])

-- g:clipboard definition for Windows WSL
vim.cmd([[
  let g:clipboard = {
    \   'name': 'WslClipboard',
    \   'copy': {
      \      '+': 'clip.exe',
      \      '*': 'clip.exe',
      \    },
      \   'paste': {
        \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        \   },
        \   'cache_enabled': 0,
        \ }
        ]])
