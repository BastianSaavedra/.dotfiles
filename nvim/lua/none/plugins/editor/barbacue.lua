return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		{ "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" },
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	config = function()
		local barbecue = require("barbecue")

		barbecue.setup({
			attach_navic = false,
		})
	end,
}
