return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    keys = {{
        '<C-b>',
        ':NvimTreeToggle<CR>',
        silent = true
    }, {
        '<C-i>',
        ':NvimTreeFindFile<CR>',
        silent = true
    }},
    opts = {
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        sync_root_with_cwd = true,
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
                hint = '',
                info = '',
                warning = '',
                error = ''
            }
        },
        renderer = {
            root_folder_modifier = ':t',
            icons = {
                glyphs = {
                    git = {
                        unstaged = '✗',
                        staged = '✓',
                        unmerged = '',
                        renamed = '➜',
                        untracked = '★',
                        deleted = '',
                        ignored = '◌'
                    }
                }
            }
        },
        filters = {
            custom = {'^.git$'}
        },
        update_focused_file = {
            enable = true,
            update_root = true
        },
        view = {
            width = 50
        }
    }
}
