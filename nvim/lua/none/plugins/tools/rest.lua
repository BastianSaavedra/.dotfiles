return {
	"vhyrro/luarocks.nvim",
	priority = 1000,
	config = true,
	opts = {
		rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
	},
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		dependencies = { "luarocks.nvim" },
		config = function()
			require("rest-nvim").setup({
				keybinds = {
					{
						";rr",
						"<cmd>Rest run<CR>",
						"Rest: run request under the cursor",
					},
				},
			})
		end,
	},
}
