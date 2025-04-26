vim.opt.termguicolors = false

-- Vimremaps
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- relative line numbers
vim.wo.relativenumber = true

-- Set indent length
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Load lazyvim
require("config.lazy")

-- Rebinds
vim.keymap.set({ "n" }, "<leader>c", "<cmd>bd!<cr>", { desc = "Close buffer" })
vim.keymap.set({ "n" }, "<leader>o", "<cmd>Oil<cr>", { desc = "Open oil" })

-- Open oil when nvim starts with no params
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- If no files or directories are passed, open Oil
		if vim.fn.argc() == 0 then
			vim.defer_fn(function()
				require("oil").open()
				-- Force a refresh of the view
				vim.cmd("doautocmd BufEnter")
			end, 10)
		end
	end,
})
