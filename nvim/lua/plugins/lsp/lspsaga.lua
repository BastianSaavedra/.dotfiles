return {
    'nvimdev/lspsaga.nvim',
    config = function()
        local lspsaga = require('lspsaga')
        lspsaga.setup({
            server_filetype_map = {},
            symbols_in_winbar = {
                enable = true,
                color_mode = true,
                delay = 300
            },
            diagnostic = {
                show_code_action = false,
                show_source = true,
            },
            lightbulb = {
                enable = false,
                enable_in_insert = false,
                sign = false,
                sign_property = 40,
                virtual_text = false,
            }

        })


        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<space>e', '<Cmd>Lspsaga diagnostic_jump_next<cr>',opts)
        vim.keymap.set('n', 'rn', '<Cmd>Lspsaga rename<cr>', opts)
        vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
        -- vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opts)

    end,
}
