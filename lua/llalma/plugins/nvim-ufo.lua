init = {
    "kevinhwang91/nvim-ufo",
    dependencies = {
	"kevinhwang91/promise-async"
    },
    config = function()
	vim.opt.foldlevelstart = 99
	require("ufo").setup(opts)

	vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
	vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

	vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
	vim.o.foldcolumn = "1"
    end

}

return init
