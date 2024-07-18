return {
	"zaldih/themery.nvim",
	config = function()
		themary = require("themery")

		themary.setup({
			themes = {
				-- tokyonight themes
				{ name = "tokyonight night", colorscheme = "tokyonight-night" },
				{ name = "Tokyonight Storm", colorscheme = "tokyonight-storm" },
				{ name = "Tokyonight Day", colorscheme = "tokyonight-day" },
				{ name = "Tokyonight Moon", colorscheme = "tokyonight-moon" },
				-- One dark themes
				{ name = "One dark", colorscheme = "onedark" },
				{ name = "One Light", colorscheme = "onelight" },
				-- neon theme
				{ name = "Neon", colorscheme = "neon" },
				-- One nord theme
				{ name = "One Nord", colorscheme = "onenord" },
				-- Material themes
				{ name = "Material Darker", colorscheme = "material-darker" },
				{ name = "Material Lighter", colorscheme = "material-lighter" },
				{ name = "Material Oceanic", colorscheme = "material-oceanic" },
				{ name = "Material Deep Ocean", colorscheme = "material-deep-ocean" },
				{ name = "Material Palenight", colorscheme = "material-palenight" },
				-- kanagawa themes
				{ name = "kanagawa wave", colorscheme = "kanagawa-wave" },
				{ name = "kanagawa lotus", colorscheme = "kanagawa-lotus" },
				{ name = "kanagawa dragon", colorscheme = "kanagawa-dragon" },
				-- gruvbox
				{ name = "Gruvbox", colorscheme = "gruvbox-material" },
				-- github
				{ name = "Github Dark", colorscheme = "github_dark" },
				{ name = "Github light", colorscheme = "github_light" },
				{ name = "Github dimmed", colorscheme = "github_dimmed" },
				-- nord
				{ name = "Nord", colorscheme = "nord" },
			},
		})
	end,
}
