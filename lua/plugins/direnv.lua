return {
	"NotAShelf/direnv.nvim",
	config = function()
		require("direnv").setup({
			autoload_direnv = false,

			-- Statusline integration
			statusline = {
				-- Enable statusline component
				enabled = true,
				-- Icon to display in statusline
				icon = "󱚟",
			},

			keybindings = {
				allow = "<Leader>da",
				deny = "<Leader>dd",
				reload = "<Leader>dr",
				edit = "<Leader>de",
			},

			notifications = {
				-- Log level (vim.log.levels.INFO, ERROR, etc.)
				level = vim.log.levels.OFF,
				-- Don't show notifications during autoload
				silent_autoload = true,
			},
		})
	end,
}
