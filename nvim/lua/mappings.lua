require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("i", "<C-l>", 'copilot#Accept("<CR>")', { expr = true, replace_keycodes = false })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
