init = { 
    "danymat/neogen", 
	init = function()
		require('neogen').setup {
		    enabled = true,
		    languages = {
			python = {
			    template = {
				annotation_convention = "numpydoc"
				}
			},
		    }
		}

		



	end
}


vim.keymap.set({"n"}, "<leader>?", ":lua require('neogen').generate()<CR>", {desc="Comment Func/Class"})

return init
