return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
        vim.fn["mkdp#util#install"]()
    end

}

-- return {
--     "adalessa/markdown-preview.nvim",
--     dependencies = {
--         "nvim-lua/plenary.nvim",
--     },
--     config = true,
--     ft = "markdown",
-- }
