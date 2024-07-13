return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim"
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "󰄬",
                    package_pending = "󰁔",
                    package_uninstalled = "󰅖"
                }
            }
        })

        mason_lspconfig.setup({
            ensure_installed = {
                "astro",
                "bashls",
                "eslint",
                "jsonls",
                "tsserver",
                "html",
                "cssls",
                "tailwindcss",
                "lua_ls",
                "graphql",
                "emmet_ls",
                "yamlls",
                "marksman",
                "pyright",
                "sqlls",
                "clangd",
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua", -- lua formatter
                "isort", -- python formatter
                "black", -- python formatter
                "pylint",
                "eslint_d",
                "debugpy",
            }
        })


    end,
}
