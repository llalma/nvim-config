-- lint.lua
return {
	"mfussenegger/nvim-lint",
	event = { "BufWritePost", "BufReadPost", "InsertLeave" },
	config = function()
		-- every linter you might ever want, per filetype.
		-- filtered down to whatever's on PATH for this project.
		local wanted = {
			python = { "ruff" },
			sh = { "shellcheck" },
			nix = { "statix" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
		}

		local linters_by_ft = {}
		for ft, linters in pairs(wanted) do
			local available = vim.tbl_filter(function(l)
				return vim.fn.executable(l) == 1
			end, linters)
			if #available > 0 then
				linters_by_ft[ft] = available
			end
		end
		require("lint").linters_by_ft = linters_by_ft

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
