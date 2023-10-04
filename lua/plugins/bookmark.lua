return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>hl",
      function()
        return require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "View all harpoon marks",
    },
    {
      "<leader>ha",
      function()
        return require("harpoon.mark").add_file()
      end,
      desc = "Mark file with harpoon",
    },
    {
      "<leader>hn",
      function()
        return require("harpoon.mark").nav_next()
      end,
      desc = "Go to next harpoon mark",
    },
    {
      "<leader>hp",
      function()
        return require("harpoon.mark").nav_prev()
      end,
      desc = "Go to previous harpoon mark",
    },
  },
  config = function()
    vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
    vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
    vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
    vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
    vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")
  end,
}
