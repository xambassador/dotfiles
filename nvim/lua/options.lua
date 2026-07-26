require "nvchad.options"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.laststatus = 0
vim.opt.showmode = false
vim.opt.cmdheight = 0
vim.opt.ruler = false
vim.opt.showcmd = false
vim.opt.showtabline = 0
