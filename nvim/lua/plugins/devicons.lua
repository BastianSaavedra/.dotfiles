return {
    "nvim-tree/nvim-web-devicons",
    config = function ()
        require("nvim-web-devicons").setup {
            override_by_extension = {
                ["http"] = {
                    icon = "󰖟", -- nf-md-web
                    color = "#FF0000",
                    name = "http"
                }
            }

        }
    end
}
