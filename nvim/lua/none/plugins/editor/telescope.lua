return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod

		-- Trouble in telescope
		local trouble = require("trouble")
		local trouble_telescope = require("trouble.sources.telescope")

		-- notify
		telescope.load_extension("notify")

		-- fzf
		telescope.load_extension("fzf")

		-- or create your custom action
		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		telescope.setup({
			buffers = {
				mappings = {},
				colorscheme = { enable_preview = true },
			},
			defaults = {
				prompt_prefix = "󱚟 ",
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<esc>"] = actions.close,
						["<CR>"] = actions.select_default + actions.center,
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble_telescope.open,
						["<C-x>"] = actions.delete_buffer,
					},
					n = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-x>"] = actions.delete_buffer,
					},
				},
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
					},
					vertical = {
						mirror = false,
					},
				},
				color_devicons = true,
			},
			set_env = { ["COLORTERM"] = "truecolor" },
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic order
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
				},
			},
		})

		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Telescope: Find files in cwd" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope: Find buffers" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope: Find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Telescope: Find string in cwd" })
		keymap.set(
			"n",
			"<leader>fc",
			"<cmd>Telescope grep_string<CR>",
			{ desc = "Telescope: Find string under cursor in cwd" }
		)
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Telescope: Find to-do's" })
		keymap.set("n", "<leader>fp", "<cmd>Telescope media_files<CR>", { desc = "Telescope: Preview Image" })
	end,
	keys = {
		{
			"<leader>gf",
			function()
				require("telescope.builtin").git_files({ show_untracked = true })
			end,
			desc = "Telescope-Git: Find git files",
		},
		{
			"<leader>gs",
			function()
				require("telescope.builtin").git_status()
			end,
			desc = "Telescope-Git: Find git files Status",
		},
		{
			"<leader>gc",
			function()
				require("telescope.builtin").git_bcommits()
			end,
			desc = "Telescope-Git: Find git commits",
		},
		{
			"<leader>gb",
			function()
				require("telescope.builtin").git_branches()
			end,
			desc = "Telescope-Git: Find git branches",
		},
		{
			"<leader>br",
			function()
				require("telescope").extensions.file_browser.file_browser({ path = "%:h:p", select_buffer = true })
			end,
			desc = "Telescope: Find File Browser",
		},
	},
}
