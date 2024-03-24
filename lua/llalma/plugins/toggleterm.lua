init =  {
    'akinsho/toggleterm.nvim', version = "*", 
    config=true,
    opts = {
	direction="float"
    }
}


-- keymaps
vim.keymap.set({"n", "t"}, "<f7>", "<cmd>ToggleTerm<CR>", {noremap = true, silent = true}, {desc="Toggle Terminal"})


return init
