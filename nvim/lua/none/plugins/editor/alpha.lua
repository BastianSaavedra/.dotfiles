return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set header
        dashboard.section.header.val = {
            " ███╗   ██╗ ██████╗ ███╗   ██╗███████╗ ",
            " ████╗  ██║██╔═══██╗████╗  ██║██╔════╝ ",
            " ██╔██╗ ██║██║   ██║██╔██╗ ██║█████╗   ",
            " ██║╚██╗██║██║   ██║██║╚██╗██║██╔══╝   ",
            " ██║ ╚████║╚██████╔╝██║ ╚████║███████╗ ",
            " ╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝ ",
        }

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("e", " > New File", "<cmd>ene<CR>"),
            dashboard.button("SPC ee", " > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
            dashboard.button("SPC sf", "󰱽 > Search File", "<cmd>Telescope find_files<CR>"),
            dashboard.button("q", "󰩈 > Quit Nvim", "<cmd>qa<CR>")
        }

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
    end,

}
