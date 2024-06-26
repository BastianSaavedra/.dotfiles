return {
    "folke/noice.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify"
    },
    event = "VeryLazy",
    opts = {
        routes = {
            {
                filter = { event = "notify", find = "No information available" },
                opts = { skip = true },
            },
        },
        presets = {
            lsp_doc_border = true,
            bottom_search = false
        },
        cmdline = {
            enabled = true
        }
    },
}
