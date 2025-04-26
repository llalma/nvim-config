return {
	"ribru17/bamboo.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("bamboo").setup({
			style = "multiplex",

			code_style = {
				comments = { italic = true },
				conditionals = { italic = true },
				keywords = {},
				functions = {},
				namespaces = { italic = true },
				parameters = { italic = true },
				strings = {},
				variables = {},
			},

			lualine = {
				transparent = false, -- lualine center bar transparency
			},
		})
		require("bamboo").load()
	end,
}
