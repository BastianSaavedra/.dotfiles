return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    event = "VeryLazy",
    main  = "nvim-treesitter.configs",
    opts  = {
        ensure_installed = {
            "astro", "bash", "css","graphql", "html", "htmldjango", "http",
            "javascript", "json", "lua", "luadoc", "markdown",
            "markdown_inline", "php", "python", "sql",
            "typescript", "tsx", "yaml", "xml", "rasi"
        },
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        autopairs = {
            enable = true,
        },
        autotags = {
            enable = true,
            enable_rename = true,
            enable_close = true,
            filetypes = {
                "html", "xml", "tsx", "javascript", "javascriptreact",
                "typescript", "typescriptreact", "astro"
            }
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
        }

    }
}
