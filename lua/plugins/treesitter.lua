return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = {'BufReadPost', 'BufNewFile'},
    opts = {
        ensure_installed = {
            'lua', 'c', 'cpp', 'javascript', 'typescript', 'json', 'git_config',
            'git_rebase', 'gitcommit', 'gitignore', 'gitattributes', 'comment',
            'diff', 'tsx'
        },
        ignore_install = {''},
        auto_install = true,
        matchup = {enabled = true},
        highlight = {enable = true}
    },
    config = function(_, opts) require('nvim-treesitter.configs').setup(opts) end
}
