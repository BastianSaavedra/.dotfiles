return {
    "williamboman/mason.nvim",
    -- config = true,
    opts = {
        ensure_installed = {
            "lua-language-server",
            "pyright",
            -- "prettier",
            "typescript-language-server",
            "yaml-language-server"
        }
    }
}
