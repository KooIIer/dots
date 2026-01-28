vim.g.mapleader = " "

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 20
vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd [[
  au BufRead,BufNewFile *.ino set filetype=cpp
]]

require("kooller.lazy_init")
require("kooller.remap")
