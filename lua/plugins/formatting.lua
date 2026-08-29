local conform_ns = vim.api.nvim_create_namespace("conform_formatting")

-- Helper to extract the actual root error line from treefmt output
local function sanitize_error(err)
	local lines = vim.split(err, "\n", { trimempty = true })
	for i = #lines, 1, -1 do
		local line = lines[i]:match("^%s*(.-)%s*$")
		-- Skip treefmt wrapper and generic summary lines
		if
			line ~= ""
			and not line:match("^Formatter 'treefmt'")
			and not line:match("^ERRO formatter")
			and not line:match("failed to finalise formatting")
		then
			return line
		end
	end
	return "Formatting failed"
end

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = false,

		formatters_by_ft = {
			["_"] = { "treefmt" },
		},
		formatters = {
			treefmt = {
				require_cwd = false,
			},
		},

		format_on_save = function(bufnr)
			return { timeout_ms = 3000, lsp_fallback = true }, function(err)
				-- Clear previous formatting diagnostics on each save attempt
				vim.diagnostic.reset(conform_ns, bufnr)

				if err then
					-- Extract line number from formatter output (e.g., ":1:1" or "line 2:")
					local line_str = err:match(":(%d+):") or err:match("line (%d+)")
					local lnum = line_str and (tonumber(line_str) - 1) or 0

					-- Strip temporary conform filename junk for cleaner display
					local clean_msg = sanitize_error(err)

					-- Set diagnostic on the specific line in the buffer
					vim.diagnostic.set(conform_ns, bufnr, {
						{
							lnum = lnum,
							col = 0,
							message = clean_msg,
							severity = vim.diagnostic.severity.ERROR,
							source = "conform",
						},
					})
				end
			end
		end,
	},
}
