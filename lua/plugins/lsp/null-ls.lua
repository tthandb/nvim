return {
    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = 'williamboman/mason.nvim',
        event = {'BufReadPre', 'BufNewFile'},
        opts = function()
            local nls = require('null-ls')
            return {
                sources = {
                    nls.builtins.formatting.stylua,
                    nls.builtins.formatting.prettierd,
                    nls.builtins.diagnostics.luacheck,
                    nls.builtins.code_actions.eslint_d,
                    nls.builtins.diagnostics.eslint_d,
                }
            }
        end
    }
}
