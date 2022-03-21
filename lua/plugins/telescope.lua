local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      }
    },
    file_ignore_patterns = {
      "node_modules"
    }
  }
}

vim.api.nvim_set_keymap("n", "<Leader>n", ":Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>b", ":Telescope buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>g", ":Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>t", ":Telescope help_tags<CR>", { noremap = true })
