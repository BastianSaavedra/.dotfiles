return {
    "rebelot/kanagawa.nvim",
    config = function()
        -- Default options:
        require('kanagawa').setup({
            compile = false, -- enable compiling the colorscheme
            undercurl = true, -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false, -- do not set background color
            dimInactive = false, -- dim inactive window `:h hl-NormalNC`
            terminalColors = true, -- define vim.g.terminal_color_{0,17}
            colors = {     -- add/modify theme and palette colors
                palette = {},
                theme = {
                    wave = {}, lotus = {}, dragon = {},
                    all = {
                        ui = {
                            bg_gutter = "none",
                            float = {
                                bg = "none"
                            },
                            pmenu = {
                                bg = "none"
                            }

                        }
                    }
                },
            },
            -- overrides = function(colors) -- add/modify highlights
            --     return {}
            -- end,
            theme = "wave"

        })
    end

}
