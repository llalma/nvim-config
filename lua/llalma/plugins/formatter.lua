init =  {
    'mhartington/formatter.nvim',
    lazy = false,
    config = function()
        -- Utilities for creating configurations
        local util = require "formatter.util"

        -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
        require("formatter").setup({
            -- All formatter configurations are opt-in
            filetype = {
                ["*"] = {
                    require("formatter.filetypes.any").remove_trailing_whitespace,
                    function()
                        vim.lsp.buf.format({ async = true })
                    end,
                },
		["python"] = { 
		    require("formatter.filetypes.python").black,
                    function()
                        vim.lsp.buf.format({ async = true })
                    end,
		},
		["rust"] = { 
		    require("formatter.filetypes.rust").rustfmt,
                    function()
                        vim.lsp.buf.format({ async = true })
                    end,
		}
            }
        })

	-- Add formatting on save
	local augroup = vim.api.nvim_create_augroup
	local autocmd = vim.api.nvim_create_autocmd
	augroup("__formatter__", { clear = true })
	autocmd("BufWritePost", {
		group = "__formatter__",
		command = ":FormatWrite",
	})
    end	
}

return init


-- Remap
-- vim.keymap.set("n", 
-- 	"<leader>/",
 	-- function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end
