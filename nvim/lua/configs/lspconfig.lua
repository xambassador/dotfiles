require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ts_ls", "gopls" }
vim.lsp.config("gopls", {
  settings = {
    gopls = {
      gofumpt = true,
    },
  },
})
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
