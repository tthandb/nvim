vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>b", ":Telescope buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>g", ":Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>t", ":Telescope help_tags<CR>", { noremap = true })
