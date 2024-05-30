return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
            highlight = { enable = true },
            indent = { enable = true },
            autopairs = { enable = true },
            autotag = {
                enable = true,
                enable_rename = true,
                enable_close = true,
                filetypes = {
                    "html", "xml", "tsx", "javascript", "javascriptreact",
                    "typescript", "typescriptreact", "astro",
                },
            },
            -- Languages parsers
            ensure_installed = {
                "astro",
                "bash",
                "css",
                "graphql",
                "html",
                "htmldjango",
                "http",
                "javascript",
                "json",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "php",
                "python",
                "sql",
                "typescript",
                "tsx",
                "yaml",
                "xml",
                "rasi",
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@conditional.outer",
                        ["ic"] = "@conditional.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                    },
                },
            },

        })
    end

}
