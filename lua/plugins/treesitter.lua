return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter").install({
        "javascript", "typescript", "jsdoc", "tsx",
        "json", "yaml",
        "lua", "luadoc",
        "markdown", "markdown_inline",
        "query", "regex",
        "vim", "vimdoc",
      })

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("nvim_treesitter_highlight", { clear = true }),
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
