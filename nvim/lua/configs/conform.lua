-- Docs: https://github.com/stevearc/conform.nvim#formatters

-- Prettier is only enabled when a config file is found in the project root.
local prettier_configs = {
  ".prettierrc",
  ".prettierrc.js",
  ".prettierrc.cjs",
  ".prettierrc.mjs",
  ".prettierrc.json",
  ".prettierrc.json5",
  ".prettierrc.yaml",
  ".prettierrc.yml",
  ".prettierrc.toml",
  "prettier.config.js",
  "prettier.config.cjs",
  "prettier.config.mjs",
}

-- oxfmt is only enabled when a config file is found in the project root.
local oxc_configs = {
  "oxc.config.json",
  ".oxfmtrc.json",
  ".oxfmtrc.jsonc",
  "oxfmt.config.ts",
}

-- Walks up from the current buffer's directory looking for any of the given
-- config files. Returns true only if one is found, otherwise the formatter is skipped.
-- Uses vim.fs.root: https://neovim.io/doc/user/lua.html#vim.fs.root()
local function has_config(files)
  return function(_, ctx)
    return vim.fs.root(ctx.buf, files) ~= nil
  end
end

local options = {
  -- Docs: https://github.com/stevearc/conform.nvim#options
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "oxfmt", "prettier", stop_after_first = true },
    typescript = { "oxfmt", "prettier", stop_after_first = true },
    javascriptreact = { "oxfmt", "prettier", stop_after_first = true },
    typescriptreact = { "oxfmt", "prettier", stop_after_first = true },
  },

  formatters = {
    prettier = {
      condition = has_config(prettier_configs),
    },
    oxfmt = {
      command = "oxfmt",
      args = { "--stdin-filepath", "$FILENAME" },
      stdin = true,
      condition = has_config(oxc_configs),
    },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
