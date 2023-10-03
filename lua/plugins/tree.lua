return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<C-b>", ":NvimTreeToggle<CR>", silent = true },
    { "<C-i>", ":NvimTreeFindFile<CR>", silent = true },
  },
  opts = {
    hijack_directories = { enable = false },
    actions = {
      open_file = {
        quit_on_open = true,
        window_picker = {
          enable = false,
        },
      },
      change_dir = {
        enable = false,
        global = false,
      },
    },
    disable_netrw = true,
    sync_root_with_cwd = true,
    diagnostics = {
      enable = true,
      show_on_dirs = true,
    },
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    view = {
      width = 35,
      relativenumber = true,
    },
  },
  config = function()
    local nvimtree = require("nvim-tree")

    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

    -- configure nvim-tree
    nvimtree.setup({
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
    })
  end,
}
