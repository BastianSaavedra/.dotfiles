-- Command to start a new API code
vim.api.nvim_create_user_command("Pyapi", function()
	local buf = vim.api.nvim_get_current_buf()
	local python_api = {
		"import requests",
		"url = 'www.example.com'",
		"token = 'xxxxxxxxxxx'",
		"headers = {'Content-Type': 'application/json', 'Authorization': token}",
		"response = requests.request('GET', url, headers=headers)",
		"if response.status_code == 200:",
		"	reponse.json()",

	}

	vim.api.nvim_buf_set_lines(buf, -1, -1, true, python_api)
end, {})
