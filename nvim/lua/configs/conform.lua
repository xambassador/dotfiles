-- Docs: https://github.com/stevearc/conform.nvim#formatters
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

local oxc_configs = {
  "oxc.config.json",
  ".oxfmtrc.json",
  ".oxfmtrc.jsonc",
  "oxfmt.config.ts",
}

local function has_config(files)
  return function(_, ctx)
    return vim.fs.root(ctx.buf, files) ~= nil
  end
end

local function local_bin_or_global(name)
  return function(_, ctx)
    local bin = ctx.dirname .. "/node_modules/.bin/" .. name
    if vim.uv.fs_stat(bin) then
      return bin
    end
    for parent in vim.fs.parents(ctx.dirname) do
      bin = parent .. "/node_modules/.bin/" .. name
      if vim.uv.fs_stat(bin) then
        return bin
      end
    end
    return name
  end
end

local no_format_on_save_fts = {
  json = true,
  jsonc = true,
  markdown = true,
}

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports" },
    javascript = { "oxfmt", "prettier", stop_after_first = true },
    typescript = { "oxfmt", "prettier", stop_after_first = true },
    javascriptreact = { "oxfmt", "prettier", stop_after_first = true },
    typescriptreact = { "oxfmt", "prettier", stop_after_first = true },
  },

  formatters = {
    prettier = {
      condition = has_config(prettier_configs),
      command = local_bin_or_global "prettier",
    },
    oxfmt = {
      command = local_bin_or_global "oxfmt",
      args = { "--stdin-filepath", "$FILENAME" },
      stdin = true,
      condition = has_config(oxc_configs),
    },
  },

  format_on_save = function(bufnr)
    if no_format_on_save_fts[vim.bo[bufnr].filetype] then
      return nil
    end
    return {
      timeout_ms = 2000,
      lsp_fallback = true,
    }
  end,
}

return options
