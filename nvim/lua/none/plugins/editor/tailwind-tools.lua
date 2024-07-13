return {
	"roobert/tailwindcss-colorizer-cmp.nvim",
	config = function()
		-- import
		local tailwindcss = require("tailwindcss-colorizer-cmp")
		local cmp = require("cmp")

		tailwindcss.setup({
			color_square_width = 2,
		})

		cmp.config.formatting = {
			format = tailwindcss.formatter,
		}
	end,
}
