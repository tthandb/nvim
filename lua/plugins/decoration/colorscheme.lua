return {
    'olimorris/onedarkpro.nvim',
    lazy = false,
    priority = 1000,
    config = function(_, opts)
        local onedarkpro = require('onedarkpro')
        onedarkpro.setup(opts)
        onedarkpro.load()
    end,
}
