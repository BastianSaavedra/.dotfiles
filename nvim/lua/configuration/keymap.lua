-- Modes
-- 	normal_mode = 'n'
-- 	insert_mode = 'i'
-- 	visual_mode = 'v'
-- 	visual_block_mode = 'x'
-- 	term_mode = 't'
-- 	command_mode = 'c'
--
-- C = ctrl
-- M = alt
-- S = shift
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true, desc = "Remap Space as Leader Key" })
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- NORMAL --
-- Better window navigation
keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Move to Down" })
keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Move to Left" })
keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Move to Up" })
keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Move to Right" })

-- Jump
keymap("n", "<leader>l", "$", { noremap = true, silent = true, desc = "Jump to Left" })
keymap("n", "<leader>h", "^", { noremap = true, silent = true, desc = "Jump to Right" })

-- Resize with alt + hjkl
keymap("n", "<M-j>", ":resize -2<CR>", { noremap = true, silent = true, desc = "Resize to Down" })
keymap("n", "<M-k>", ":resize +2<CR>", { noremap = true, silent = true, desc = "Resize to Up" })
keymap("n", "<M-h>", ":vertical resize -2<CR>", { noremap = true, silent = true, desc = "Resize to Left" })
keymap("n", "<M-l>", ":vertical resize +2<CR>", { noremap = true, silent = true, desc = "Resize to Right" })

-- Save file
keymap("n", "<Leader>w", ":w<CR>", { desc = "Save file"})

-- NvimTree
keymap("n", "<Leader>n", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Open NvimTree" })

-- Close current buffer
keymap("n", "<leader>bd", ":bd<CR>", { desc = "Close current Buffer"})

-- Navigate buffers
keymap("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
keymap("n", "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })

-- Restart Lua
keymap("n", "<Leader>fl", ":luafile%<CR>", { noremap = true, silent = true, desc = "Restart Lua" })

-- Close Terminal
keymap("n", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Close Terminal" })

-- Quit
keymap("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = "Quit" })

-- Remap escape
keymap("n", "<C-c>", "<Esc>", { desc = "Remap Escape"})


-- INSERT --
keymap("i", "jk", "<Esc>", { desc = "Remap Escape"})


-- VISUAL --
-- Better tabbing
keymap("v", "<", "<gv", { noremap = true, silent = true, desc = "Better tabbing to Left" })
keymap("v", ">", ">gv", { noremap = true, silent = true, desc = "Better tabbing to Right" })


