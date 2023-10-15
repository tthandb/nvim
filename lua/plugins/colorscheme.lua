return {
  --   {
  --   "Mofiqul/vscode.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme vscode]])
  --   end,
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = { style = "moon" },
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
