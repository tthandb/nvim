local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  diagnostics = {
    enable = true,
    show_on_dirs = true
  },
  update_focused_file = {
    enable = true, 
    update_root = true, 
  },

  view = {
    width = 50, 
  },
}

vim.api.nvim_set_keymap("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-i>", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
