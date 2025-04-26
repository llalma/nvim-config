return {
	"theprimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()

		-- Set keybinds
		vim.keymap.set("n", "<leader><leader>a", function()
			harpoon:list():add()
		end, { desc = "Add file" })
		vim.keymap.set("n", "<leader><leader>m", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Menu" })
		vim.keymap.set("n", "<leader><leader>1", function()
			harpoon:list():select(1)
		end, { desc = "File 1" })
		vim.keymap.set("n", "<leader><leader>2", function()
			harpoon:list():select(2)
		end, { desc = "File 2" })
		vim.keymap.set("n", "<leader><leader>3", function()
			harpoon:list():select(3)
		end, { desc = "File 3" })
		vim.keymap.set("n", "<leader><leader>4", function()
			harpoon:list():select(4)
		end, { desc = "File 4" })
		vim.keymap.set("n", "<leader><leader>5", function()
			harpoon:list():select(5)
		end, { desc = "File 5" })
	end,
}
