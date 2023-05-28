return {
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    branch = '0.1.x',
    keys = {
        {'<leader>fn', ':Telescope find_files<CR>', desc = "Find files"},
        {'<leader>fg', ':Telescope live_grep<CR>', desc = "Find text"},
        {'<leader>fb', ':Telescope buffers<CR>', desc = "Find buffers"},
        {'<leader>fh', ':Telescope help_tags<CR>', desc = "Find help tags"}, {
            '<leader>fm',
            function()
                return require('telescope.builtin').man_pages()
            end,
            desc = "Find man pages"
        }, {
            '<leader>fr',
            function() return require('telescope.builtin').oldfiles() end,
            desc = "Find recent files"
        }, {
            '<leader>fR',
            function()
                return require('telescope.builtin').registers()
            end,
            desc = "Find registers"
        }, {
            '<leader>fk',
            function() return require('telescope.builtin').keys() end,
            desc = "Find keys"
        }, {
            '<leader>fc',
            function() return require('telescope.builtin').commands() end,
            desc = "Find commands"
        }, {
            '<leader>go',
            function()
                return require('telescope.builtin').git_status()
            end,
            desc = "Git status"
        }, {
            '<leader>gb',
            function()
                return require('telescope.builtin').git_branches()
            end,
            desc = "Git branches"
        }, {
            '<leader>gc',
            function()
                return require('telescope.builtin').git_commits()
            end,
            desc = "Git commits"
        }
    },
    opts = {
        defaults = {
            path_display = {'smart'},
            file_ignore_patterns = {'.git/'},
            layout_strategy = 'horizontal',
            layout_config = {prompt_position = 'top'},
            sorting_strategy = 'ascending'
        },
        pickers = {
            find_files = {
                find_command = {
                    'rg', '--files', '--hidden', '--glob', '!**/.git/*'
                }
            }
        }
    }
}
