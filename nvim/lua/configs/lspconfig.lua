require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "vtsls", "gopls", "jsonls" }

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      gofumpt = true,
    },
  },
})

vim.lsp.config("jsonls", {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

vim.lsp.enable(servers)
