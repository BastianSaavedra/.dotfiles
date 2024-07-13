-- Command to start a new POST Request
vim.api.nvim_create_user_command("POSTRequest", function ()
    local buf = vim.api.nvim_get_current_buf()
    local request = {
        "POST url ",
        "header name: header value",
        "",
        "{",
        '   "content": "value",',
        "}"
    }
    vim.api.nvim_buf_set_lines(buf, -1, -1, true, request)
end, {})

-- Command to start a new GET Request
vim.api.nvim_create_user_command("GETRequest", function ()
    local buf = vim.api.nvim_get_current_buf()
    local request = {
        "GET url",
    }
    vim.api.nvim_buf_set_lines(buf, -1, -1, true, request)
end, {})
