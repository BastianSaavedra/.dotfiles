return {
    "nvim-telescope/telescope.nvim",
    event = 'VeryLazy',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = 'make'
        }
    },
    config = function ()
        local actions = require('telescope.actions')
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<esc>"] = actions.close,
                        ["<CR>"] = actions.select_default + actions.center
                    },
                    n = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    }
                }
            },
            extensions = {
                fzf = {
                    fuzzy = true,                       -- false will only do exact matching
                    override_generic_sorter = true,     -- override the generic order
                    override_file_sorter = true,        -- override the file sorter   
                    case_mode = "smart_case",           -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
                },
            }
        })
        require('telescope').load_extension('fzf')


    end,
    keys = {
        {
            "<leader>gf",
            function ()
                require('telescope.builtin').git_files({ show_untracked = true })
            end,
            desc = "Telescope Git Files",
        },
        {
            "<leader>bf",
            function ()
                require("telescope.builtin").buffers()
            end,
            desc = "Telescope buffers",
        },
        {
            "<leader>gs",
            function ()
                require("telescope.builtin").git_status()
            end,
            desc = "Telescope Git Status"
        },
        {
            "<leader>gc",
            function ()
                require("telescope.builtin").git_bcommits()
            end,
            desc = "Telescope Git Commits"
        },
        {
            "<leader>gb",
            function ()
                require("telescope.builtin").git_branches()
            end,
            desc = "Telescope Git Branches",
        },
        {
            "<leader>ap",
            function ()
                require("telescope.builtin").find_files({
                    prompt_title = "Plugins",
                    cwd = "~/.config/nvim/lua/plugins/",
                    attach_mappings = function (_, map)
                        local actions = require("telescope.actions")
                        local action_state = require("telescope.actions.state")
                        map("i", "<C-y>", function (prompt_bufnr)
                            local new_plugin = action_state.get_current_line()
                            actions.close(prompt_bufnr)
                            vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua", new_plugin))
                        end)
                        return true
                    end
                })
            end
        },
        {
            "<leader>sf",
            function ()
                require("telescope.builtin").find_files()
            end,
            desc = "Telescope Find Files"
        },
        {
            "<leader>th",
            function ()
                require("telescope.builtin").help_tags()
            end,
            desc = "Telescope Help"
        },
        {
            "<leader>br",
            function ()
                require("telescope").extensions.file_browser.file_browser({ path = "%:h:p", select_buffer = true })
            end,
            desc = "Telescope File Browser"
        }

    },

}
