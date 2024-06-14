return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local nvim_tree = require("nvim-tree")
        nvim_tree.setup {
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 30,
                side = "left",
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = false,
                git_ignored = false,
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
            },
            update_focused_file = {
                enable = true,
                update_cwd = true,
            },
        }
    end,
}
