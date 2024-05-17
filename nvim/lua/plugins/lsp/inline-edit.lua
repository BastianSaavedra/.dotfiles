return {
    "AndrewRadev/inline_edit.vim",
    config = function ()
        vim.keymap.set('n', '<space>js', '<Cmd>InlineEdit<cr>',
            {
                noremap = true,
                silent = true,
                desc = "Inline edit Javascript and Typescript"
            }
        )
    end
}
