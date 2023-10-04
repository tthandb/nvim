local lsp_servers = { "tsserver", "html", "cssls", "tailwindcss", "lua_ls", "graphql", "pyright" }

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local navic = require("nvim-navic")

      -- enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Change the Diagnostic symbols in the sign column (gutter)
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- attach servers

      local exclude_list = { "lua_ls", "tailwindcss" }

      for _, server in ipairs(lsp_servers) do
        local is_general = true
        for _, exclude_server in ipairs(exclude_list) do
          if server == exclude_server then
            is_general = false
          end
        end

        if is_general then
          lspconfig[server].setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
              navic.attach(client, bufnr)
            end,
          })
        end
      end

      lspconfig["tailwindcss"].setup({
        capabilities = capabilities,
      })

      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          navic.attach(client, bufnr)
        end,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")

      -- enable mason and configure icons
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      mason_lspconfig.setup({
        -- list of servers for mason to install
        ensure_installed = lsp_servers,
        -- auto-install configured servers (with lspconfig)
        automatic_installation = true, -- not the same as ensure_installed
      })

      mason_tool_installer.setup({
        ensure_installed = {
          "prettier", -- prettier formatter
          "stylua", -- lua formatter
          "eslint_d", -- js linter
          "isort", -- python formatter
          "black", -- python formatter
        },
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim", -- configure formatters & linters
    lazy = true,
    event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      local mason_null_ls = require("mason-null-ls")

      local null_ls = require("null-ls")

      local null_ls_utils = require("null-ls.utils")

      mason_null_ls.setup({
        ensure_installed = {
          "prettier", -- prettier formatter
          "stylua", -- lua formatter
          "eslint_d", -- js linter
          "black", -- python formatter
          "pylint", -- python linter
        },
      })

      -- for conciseness
      local formatting = null_ls.builtins.formatting -- to setup formatters
      local diagnostics = null_ls.builtins.diagnostics -- to setup linters

      -- to setup format on save
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      -- configure null_ls
      null_ls.setup({
        root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
        sources = {
          formatting.prettier.with({
            condition = function(utils)
              return utils.root_has_file({ ".prettierrc", ".prettierrc.json", ".prettierrc.js" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
            end,
          }), -- js/ts formatter
          formatting.stylua, -- lua formatter
          diagnostics.eslint_d.with({ -- js/ts linter
            condition = function(utils)
              return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
            end,
          }),
          formatting.isort,
          formatting.black,
          diagnostics.pylint,
        },
        -- configure format on save
        -- on_attach = function(current_client, bufnr)
        --   if current_client.supports_method("textDocument/formatting") then
        --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        --     vim.api.nvim_create_autocmd("BufWritePre", {
        --       group = augroup,
        --       buffer = bufnr,
        --       callback = function()
        --         vim.lsp.buf.format({
        --           filter = function(client)
        --             --  only use null-ls for formatting instead of lsp server
        --             return client.name == "null-ls"
        --           end,
        --           bufnr = bufnr,
        --         })
        --       end,
        --     })
        --   end
        -- end,
      })
    end,
  },
}
