init = {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
	require("harpoon"):setup()
	require("which-key").register({ ["<leader>"] = {
	    ["<leader>"] = {
	      name = "Harpoon",
		a = { function() require("harpoon"):list():add() end, "Add file" },
		m = { function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Menu" },
		["1"] = { function() require("harpoon"):list():select(1) end, "File 1" },
		["2"] = { function() require("harpoon"):list():select(2) end, "File 2" },
		["3"] = { function() require("harpoon"):list():select(3) end, "File 3" },
		["4"] = { function() require("harpoon"):list():select(4) end, "File 4" },
		["5"] = { function() require("harpoon"):list():select(5) end, "File 5" },
	    },
	  }
	})
    end
}

return init
