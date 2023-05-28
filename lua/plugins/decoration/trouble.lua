return {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'LspAttach',
    keys = {
        {'<leader>xx', '<cmd>TroubleToggle<CR>', desc = "Toggle trouble"}, {
            '<leader>xw',
            '<cmd>TroubleToggle workspace_diagnostics<CR>',
            desc = "Toggle workspace diagnostics"
        }, {
            '<leader>xd',
            '<cmd>TroubleToggle document_diagnostics<CR>',
            desc = "Toggle document_diagnostics"
        },
        {
            '<leader>xq',
            '<cmd>TroubleToggle quickfix<CR>',
            desc = "Open up quickfix"
        }, {
            '<leader>xl',
            '<cmd>TroubleToggle loclist<CR>',
            desc = "Open up location list"
        }, {
            '<leader>xr',
            '<cmd>TroubleToggle lsp_references<CR>',
            desc = "Open up lsp references"
        }
    },
    config = true
}
