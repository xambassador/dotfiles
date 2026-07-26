require "nvchad.mappings"

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("i", "<C-l>", 'copilot#Accept("<CR>")', { expr = true, replace_keycodes = false })


-- <leader>gt (git_status)
-- <leader>cm (git_commits)
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "telescope git branches" })
map("n", "<leader>gc", "<cmd>Telescope git_bcommits<CR>", { desc = "telescope git buffer commits" })
map("n", "<leader>gs", "<cmd>Telescope git_stash<CR>", { desc = "telescope git stash" })

map("n", "<leader>fp", function()
  local path = vim.fn.expand "%:p"
  -- vim.fn.setreg("+", path)
  vim.notify(path)
end, { desc = "show full path of current buffer" })
