return {
    "williamboman/mason.nvim",
    -- config = true,
    opts = {
        ensure_installed = {
            "lua-language-server",
            "pyright",
            "clangd",
            -- "prettier",
            "typescript-language-server",
            "yaml-language-server"
        }
    }
}
