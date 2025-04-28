return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
	local configs = require("nvim-treesitter.configs")

	configs.setup({
	    auto_install = true,
	    sync_install = false,
	    highlight = { enable = true },
	    indent = { enable = true },  
	    additional_vim_regex_highlighting = false,
	})
	for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
	    vim.api.nvim_set_hl(0, group, {})
	end
    end
 }
