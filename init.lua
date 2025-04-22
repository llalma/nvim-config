vim.opt.termguicolors = false

-- Vimremaps
vim.g.mapleader = " "

-- relative line numbers
vim.wo.relativenumber = true

-- Set indent length
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Load plugins and configs for plugins
require("llalma")
