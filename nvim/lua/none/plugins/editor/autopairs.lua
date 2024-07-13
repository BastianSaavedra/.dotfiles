return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	config = function()
		-- import nvim-autopairs
		local autopairs = require("nvim-autopairs")

		autopairs.setup({
			check_ts = true,
			-- ts_config = {
			--     lua = { "string" },
			-- },
			disable_filetype = {
				"TelescopePrompt",
				"vim",
			},
		})

		-- import nvim-autopairs completion functionality
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		-- import nvim-cmp plugin (completions plugins)
		local cmp = require("cmp")

		-- make autopairs and completion work together
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
