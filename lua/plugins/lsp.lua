-- lsp.lua
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local servers = {
			pyright = "pyright-langserver",
			rust_analyzer = "rust-analyzer",
			nil_ls = "nil",
			lua_ls = "lua-language-server",
			gopls = "gopls",
			terraformls = "terraform-ls",
		}

		local function enable_available_servers()
			local to_enable = {}
			for name, cmd in pairs(servers) do
				if vim.fn.executable(cmd) == 1 then
					table.insert(to_enable, name)
				end
			end
			vim.lsp.enable(to_enable)
			return to_enable
		end

		enable_available_servers()

		-- re-scan PATH whenever devenv finishes (re)loading, and
		-- retroactively start servers for buffers that are already open
		vim.api.nvim_create_autocmd("User", {
			pattern = "DirenvLoaded",
			callback = function()
				local enabled = enable_available_servers()
				local enabled_set = {}
				for _, n in ipairs(enabled) do
					enabled_set[n] = true
				end

				-- force LSP to (re)attach to already-open real buffers
				-- that missed the window the first time around
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if
						vim.api.nvim_buf_is_loaded(buf)
						and vim.bo[buf].buftype == ""
						and vim.api.nvim_buf_get_name(buf) ~= ""
					then
						if #vim.lsp.get_clients({ bufnr = buf }) == 0 then
							vim.api.nvim_exec_autocmds("FileType", { buffer = buf })
						end
					end
				end
			end,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client then
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end
			end,
		})

		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})
	end,
}
