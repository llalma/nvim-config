return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
	config = function(_, opts)
		local oil = require("oil")
		oil.setup(opts)

		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "oil://*",
			callback = function(args)
				local dir = oil.get_current_dir(args.buf)
				if not dir then
					return
				end
				-- lcd so direnv (and the cwd-based .envrc lookup) tracks
				-- where you're actually browsing, without touching the
				-- global cwd for other windows
				vim.cmd.lcd(dir)
				require("direnv")._init(dir .. "/.envrc")
			end,
		})
	end,
}
