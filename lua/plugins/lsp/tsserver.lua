local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

require('lspconfig').tsserver.setup{
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
  root_dir = function() return vim.loop.cwd() end,      -- run lsp for javascript in any directory
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  }
}
