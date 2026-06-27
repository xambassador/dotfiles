-- NvChad LSP defaults (keymaps, capabilities): https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua
-- vim.lsp.config docs: https://neovim.io/doc/user/lsp.html#vim.lsp.config()
require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "vtsls", "gopls", "jsonls" }

-- Docs: https://github.com/mvdan/gofumpt
vim.lsp.config("gopls", {
  settings = {
    gopls = {
      gofumpt = true,
    },
  },
})

-- jsonls provides completions and validation for JSON files based on JSON Schema.
-- schemastore.nvim supplies the schema catalog from SchemaStore.org
-- schemastore.nvim: https://github.com/b0o/schemastore.nvim
-- SchemaStore catalog: https://www.schemastore.org/json/
vim.lsp.config("jsonls", {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

vim.lsp.enable(servers)
