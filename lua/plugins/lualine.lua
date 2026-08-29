return {
	"nvim-lualine/lualine.nvim",
	---@module 'lualine'
	---@type lualine.Config
	opts = {
		options = {
			theme = "auto",
			icons_enabled = true,
			component_separators = { left = "│", right = "│" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = {
				{
					function()
						return "󰨰 Format Err"
					end,
					cond = function()
						return vim.b.conform_has_error == true
					end,
					color = { fg = "#ff5555", gui = "bold" },
				},
				function()
					return require("direnv").statusline()
				end,
				"encoding",
				"fileformat",
				"filetype",
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
}
