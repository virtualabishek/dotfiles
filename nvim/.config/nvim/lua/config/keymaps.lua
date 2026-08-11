-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable default buffer navigation with Shift+H/L
vim.keymap.del("n", "H")
vim.keymap.del("n", "L")

-- Replace with Alt+J / Alt+L
vim.keymap.set("n", "<A-j>", "<Cmd>bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<A-l>", "<Cmd>bnext<CR>", { desc = "Next buffer" })
