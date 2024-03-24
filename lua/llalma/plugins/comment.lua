init =  {
    'numToStr/Comment.nvim',
    lazy = false,
}


-- Remap
vim.keymap.set("n", 
	"<leader>/",
 	function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end
)

vim.keymap.set("v", 
    "<leader>/",
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>"
)


return init


