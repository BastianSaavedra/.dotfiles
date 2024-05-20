return {
    "nvim-tree/nvim-web-devicons",
    config = function ()
        require("nvim-web-devicons").setup {
            strict = true,
            override_by_extension = {
                ["http"] = {
                    icon = "󰖟", -- nf-md-web
                    color = "#FF0000",
                    name = "http"
                },
                ["js"] = {
                    icon = "", -- nf-fa-square_js
                    color = "#F0DB4F",
                    name = "js"
                },
                ["mjs"] = {
                    icon = "", -- nf-fa-square_js
                    color = "#F0DB4F",
                    name = "mjs"
                },
                ["ts"] = {
                    icon = "", -- nf-seti-tsconfig
                    color = "#007ACC",
                    name = "ts"
                }
            },

        }

    end
}
