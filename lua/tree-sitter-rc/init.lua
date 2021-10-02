require'nvim-treesitter.install'.compilers = { 'clang' }

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "tsx",
    --[[ "lua",
    "html", ]]
    "css",
    "json"
  }, 
  highlight = {
    enable = true,  
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false
  },
  rainbow = {
    enable = true
  }
}


