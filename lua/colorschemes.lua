-- configure nvcode-color-schemes
vim.api.nvim_command([[
  let g:nvcode_termcolors=256
  syntax on
  colorscheme aurora
]])

-- checks if your terminal has 24-bit color support

if vim.fn.has('termguicolors') == 1 then
  vim.api.nvim_command([[
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
  ]])
end

