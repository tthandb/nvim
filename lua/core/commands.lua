vim.api.nvim_create_user_command("Test", 'echo "It works!"', {})
vim.cmd("com Test1 lua vim.cmd.Test()")
--vim.cmd('com Diagnostics_disable lua vim.diagnostic.disable()')
--vim.cmd('com Diagnostics_enable lua vim.diagnostic.enable()')
