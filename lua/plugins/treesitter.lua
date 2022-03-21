require'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true,  
    additional_vim_regex_highlighting = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
  },
  rainbow = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = {
      spacing = 5,
      severity_limit = 'Warning',
    },
    update_in_insert = true,
  }
)

local filetypes = {
  'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue'
}
local skip_tags = {
  'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
  'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr','menuitem'
}
