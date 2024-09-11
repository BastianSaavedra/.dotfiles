return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	opts = {
		options = {
			globalstatus = true,
			theme = "auto",
			component_separators = { left = "⏽", right = "⏽" },
			section_separators = { left = "", right = "" },
			always_divide_middle = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { { "filename", file_status = true, path = 1 } },
			lualine_x = {
				{
					require("lazy.status").updates,
					cond = require("lazy.status").has_updates,
					color = { fg = "#ff9e64" },
				},
				"encoding",
				"filetype",
				"filesize",
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
