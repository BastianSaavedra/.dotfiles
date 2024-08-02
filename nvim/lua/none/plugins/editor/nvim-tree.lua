return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvim_tree = require("nvim-tree")
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		nvim_tree.setup({
			view = {
				width = 30,
				side = "left",
				relativenumber = true,
			},
			sort = {
				sorter = "case_sensitive",
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				group_empty = true,
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			notify = {
				absolute_path = false,
			},
		})

		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current" })
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refres file explorer" })
	end,
}
