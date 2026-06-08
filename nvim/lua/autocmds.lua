require "nvchad.autocmds"

local function go_organize_imports(bufnr)
  local params = vim.lsp.util.make_range_params(0, "utf-8")
  params.context = { only = { "source.organizeImports" } }

  local result = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 1000)
  if not result then
    return
  end

  for _, res in pairs(result) do
    for _, action in pairs(res.result or {}) do
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
      end

      if action.command then
        vim.lsp.buf.execute_command(action.command)
      end
    end
  end
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function(args)
    go_organize_imports(args.buf)
    vim.lsp.buf.format {
      bufnr = args.buf,
      async = false,
    }
  end,
})
