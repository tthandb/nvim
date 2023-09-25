local lsp_server = {"tsserver", "html", "cssls", "lua_ls"}
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            {
                "williamboman/mason-lspconfig.nvim",
                opts = {ensure_installed = lsp_server}
            }, {
                "jay-babu/mason-null-ls.nvim",
                opts = {
                    automatic_setup = true,
                    handlers = {},
                    ensure_installed = {"eslint_d", "stylua"}
                }
            }
        },
        event = {"BufReadPre", "BufNewFile"},
        config = function()
            local navic = require("nvim-navic")
            local lspconfig = require("lspconfig")

            for _, lsp in ipairs(lsp_server) do
                lspconfig[lsp].setup({
                    on_attach = function(client, bufnr)
                        navic.attach(client, bufnr)
                    end
                })
            end

            lspconfig.lua_ls.setup({
                on_attach = function(client, bufnr)
                    navic.attach(client, bufnr)
                end,
                settings = {
                    Lua = {
                        diagnostics = {globals = {"vim"}},
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true
                            }
                        },
                        telemetry = {enable = false}
                    }
                }
            })

            lspconfig.tsserver.setup({
                on_attach = function(client, bufnr)
                    navic.attach(client, bufnr)
                end,
                filetypes = {"typescript", "typescriptreact", "typescript.tsx"},
                cmd = {"typescript-language-server", "--stdio"}
            })
        end
    }, {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = 'williamboman/mason.nvim',
        event = {'BufReadPre', 'BufNewFile'},
        opts = function()
            local nls = require('null-ls')
            return {
                sources = {
                    nls.builtins.formatting.stylua,
                    nls.builtins.formatting.eslint_d,
                    nls.builtins.code_actions.eslint_d,
                    nls.builtins.diagnostics.eslint_d
                }
            }
        end
    }, {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        cmd = 'Mason',
        opts = {
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗'
                }
            }
        }
    }
}
