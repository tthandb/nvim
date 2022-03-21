local nvim_lsp = require('lspconfig')

local servers = { 'pyright', 'tsserver', 'html', 'bashls', 'cssls', 'bashls', 'tailwindcss' }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
  capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

require('plugins.lsp.null-ls')
require('plugins.lsp.tsserver')

vim.api.nvim_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
