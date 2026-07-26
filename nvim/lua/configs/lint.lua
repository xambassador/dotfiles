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

lint.linters.eslint.cmd = function()
  local dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
  local bin = dir .. "/node_modules/.bin/eslint"
  if vim.uv.fs_stat(bin) then
    return bin
  end
  for parent in vim.fs.parents(dir) do
    bin = parent .. "/node_modules/.bin/eslint"
    if vim.uv.fs_stat(bin) then
      return bin
    end
  end
  return "eslint"
end

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
