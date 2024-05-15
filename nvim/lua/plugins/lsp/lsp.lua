return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "folke/neodev.nvim"
    },
    config = function()
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
        local on_attach = function(_, bufnr)
            vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
            local opts = { buffer = bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<space>f', function()
                vim.lsp.buf.format { async = true }
            end, opts)
        end
        local capabilities = vim.lsp.protocol.make_client_capabilities()
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
        require("lspconfig").cssls.setup({ on_attach = on_attach })
        -- require("lspconfig").emmet_ls.setup({
        --     on_attach = on_attach,
        --     -- capabilities = capabilities,
        --     filetypes = {
        --         "astro", "css", "html", "htmldjango",
        --         "javascript", "javascriptreact", "typescriptreact"
        --     }
        -- })
        require("lspconfig").html.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = {
                "html", "htmldjango", "javascript", "javascriptreact",
                "typescriptreact"
            },

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
                        undefined_global = false, -- remove this from diag!
                        missing_parameters = false, -- missing fields

                    }
                }
            }
        })
        require("lspconfig").marksman.setup({ on_attach = on_attach })
        require("lspconfig").pyright.setup({ on_attach = on_attach })
        require("lspconfig").sqlls.setup({ on_attach = on_attach })
        require("lspconfig").tailwindcss.setup({ on_attach = on_attach })
        require("lspconfig").tsserver.setup({ on_attach = on_attach })
        require("lspconfig").yamlls.setup({ on_attach = on_attach })
    end

}
