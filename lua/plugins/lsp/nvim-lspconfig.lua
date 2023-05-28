local lsp_server = {
    "tsserver", "html", "bashls", "cssls", "tailwindcss", "lua_ls"
}
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
                    ensure_installed = {
                        "stylua", "luacheck", "prettierd", "eslint_d"
                    }
                }
            }
        },
        keys = {
            {
                'gd',
                function()
                    return require('telescope.builtin').lsp_definitions()
                end,
                desc = "Goto Definition"
            }, {"gr", "<cmd>Telescope lsp_references<cr>", desc = "References"},
            {"gD", vim.lsp.buf.declaration, desc = "Go to Declaration"},
            {
                "gI",
                "<cmd>Telescope lsp_implementations<cr>",
                desc = "Go to Implementation"
            }, {
                "gy",
                "<cmd>Telescope lsp_type_definitions<cr>",
                desc = "Go to Type Definition"
            }, {"K", vim.lsp.buf.hover, desc = "Hover"},
            {"gK", vim.lsp.buf.signature_help, desc = "Signature Help"},
            {"<leader>gf", vim.lsp.buf.format, desc = "Format document"}
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

            lspconfig.tailwindcss.setup({})
        end
    }
}
