-- Docs: https://github.com/mfussenegger/nvim-lint

local lint = require "lint"

local eslint_configs = {
  ".eslintrc",
  ".eslintrc.js",
  ".eslintrc.cjs",
  ".eslintrc.mjs",
  ".eslintrc.json",
  ".eslintrc.yaml",
  ".eslintrc.yml",
  "eslint.config.js",
  "eslint.config.cjs",
  "eslint.config.mjs",
  "eslint.config.ts",
}

local oxlint_configs = {
  "oxlint.json",
  ".oxlintrc",
  ".oxlintrc.json",
  "oxc.config.json",
}

local js_fts = {
  javascript = true,
  typescript = true,
  javascriptreact = true,
  typescriptreact = true,
}

-- Run linters on buffer enter, after write, and when leaving insert mode.
-- We manually build the linter list instead of using linters_by_ft so we can
-- apply per-linter conditions based on config file presence.
-- Docs: https://neovim.io/doc/user/lua.html#vim.fs.root()
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function()
    local ft = vim.bo.filetype
    if not js_fts[ft] then
      return
    end

    local linters = {}
    local buf = vim.api.nvim_get_current_buf()

    if vim.fs.root(buf, eslint_configs) then
      table.insert(linters, "eslint")
    end

    if vim.fs.root(buf, oxlint_configs) then
      table.insert(linters, "oxlint")
    end

    if #linters > 0 then
      lint.try_lint(linters)
    end
  end,
})
