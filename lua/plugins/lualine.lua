return {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = {'BufReadPost', 'BufNewFile'},
    opts = {
        options = {
            theme = 'onedark',
            component_separators = {left = '', right = ''},
            section_separators = {left = '', right = ''},
            disabled_filetypes = {
                'mason', 'dashboard', 'NeogitStatus', 'NeogitCommitView',
                'NeogitPopup'
            }
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {
                'branch', 'diff',
                {'diagnostics', sources = {'nvim_lsp', 'nvim_diagnostic'}}
            },
            lualine_c = {
                'filename', {
                    function()
                        return require('nvim-navic').get_location()
                    end,
                    cond = function()
                        return require('nvim-navic').is_available()
                    end
                }
            },
            lualine_x = {'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        extensions = {'man', 'nvim-tree', 'toggleterm'}
    }
}
