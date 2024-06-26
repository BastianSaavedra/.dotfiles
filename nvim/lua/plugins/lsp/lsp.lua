return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "folke/neodev.nvim",
        {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v2.x"
        }
    },
    config = function()
        -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        local on_attach = function(_, bufnr)
            vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
            local opts = { buffer = bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', 'rn', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<space>f', function()
                vim.lsp.buf.format { async = true }
            end, opts)
        end

        -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        require("neodev").setup()
        require("lspconfig").astro.setup({
            on_attach = on_attach,
            init_options = {
                typescript = {
                    tsdk = vim.fs.normalize('/usr/lib/node_modules/typescript/lib'),
                }
            }
        })
        require("lspconfig").bashls.setup({ on_attach = on_attach })
        require("lspconfig").cssls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "vscode-css-language-server", "--stdio" }
        })
        require("lspconfig").emmet_language_server.setup({
            on_attach = on_attach
        })
        require("lspconfig").eslint.setup({
            on_attach = on_attach,
            filetypes = {
                "javascript", "javascriptreact", "javascript.jsx",
                "typescript", "typescriptreact", "typescript.tsx",
                "vue", "svelte", "astro",
            }

        })
        require("lspconfig").html.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = {
                "html", "htmldjango", "javascript", "javascriptreact",
                "typescriptreact"
            },
            cmd = { "vscode-html-language-server" , "--stdio"},
            init_options = {
                configurationSection = { "html", "css", "javascript"},
                embeddedLanguages = {
                    css = true,
                    javascript = true,
                },
                provideFormatter = true
            }

        })
        require("lspconfig").jsonls.setup({ on_attach = on_attach })
        require("lspconfig").lua_ls.setup({
            on_attach = on_attach,
            settings = {
                Lua = {
                    telemetry = { enable = false },
                    workspace = { checkThirdParty = false },
                    diagnostic = {
                        global = { 'vim' },
                    }
                }
            }
        })
        require("lspconfig").marksman.setup({ on_attach = on_attach })
        require("lspconfig").pyright.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "python" },
        })
        require("lspconfig").sqlls.setup({ on_attach = on_attach })
        require("lspconfig").tailwindcss.setup({ on_attach = on_attach })
        require("lspconfig").tsserver.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
            cmd = { "typescript-language-server", "--stdio" },
            -- init_options = {
            --     preferences = {
            --         -- disableSuggestions = true,
            --     }
            -- }
        })
        require("lspconfig").yamlls.setup({ on_attach = on_attach })
    end

}
