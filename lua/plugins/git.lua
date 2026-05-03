return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<leader>gj", function() return require("gitsigns").next_hunk() end,    desc = "Next hunk" },
      { "<leader>gk", function() return require("gitsigns").prev_hunk() end,    desc = "Prev hunk" },
      { "<leader>gl", function() return require("gitsigns").blame_line() end,   desc = "Blame line" },
      { "<leader>gp", function() return require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
      { "<leader>gr", function() return require("gitsigns").reset_hunk() end,   desc = "Reset hunk" },
      { "<leader>gR", function() return require("gitsigns").reset_buffer() end, desc = "Reset buffer" },
      { "<leader>gs", function() return require("gitsigns").stage_hunk() end,   desc = "Stage hunk" },
      { "<leader>gS", function() return require("gitsigns").stage_buffer() end, desc = "Stage buffer" },
      { "<leader>gu", function() return require("gitsigns").undo_stage_hunk() end, desc = "Undo stage hunk" },
      { "<leader>gd", function() return require("gitsigns").diffthis() end,     desc = "Diff" },
    },
    opts = {
      signs = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "-" },
        topdelete    = { text = "-" },
        changedelete = { text = "~" },
      },
      signcolumn = true,
      attach_to_untracked = true,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 0,
      },
    },
  },
}
