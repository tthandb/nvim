local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}

require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = true,
  ignore_ft_on_setup = {'dashboard'},
  auto_close = true,
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true, 
    update_cwd = true, 
    ignore_list = {}
  },
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    width = 30, 
    side = 'left', 
    auto_resize = true, 
    number=true
  },
  show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
    tree_width = 30,
  },
}

vim.api.nvim_set_keymap("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-i>", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
