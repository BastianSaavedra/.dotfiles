return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {
            open_mapping = [[<c-\>]],
            direction = "float",
            float_opts = {
                border = "curved",
                title_pos = "center",
                width = 95,
                height = 25

            },
            winbar = {
                enabled = true
            }
        }
    }
}
