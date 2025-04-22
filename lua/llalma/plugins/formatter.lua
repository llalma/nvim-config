init = {
    'mhartington/formatter.nvim',
    lazy = false,
    config = function()
        -- Utilities for creating configurations
        local util = require "formatter.util"

        -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
        require("formatter").setup({
            -- All formatter configurations are opt-in
            filetype = {
                ["python"] = {
                    require("formatter.filetypes.python").black,
                    function()
                        vim.lsp.buf.format({async = true})
                    end
                },
                ["rust"] = {
                    require("formatter.filetypes.rust").rustfmt,
                    function()
                        vim.lsp.buf.format({async = true})
                    end
                },
                ["terraform"] = {
                    require("formatter.filetypes.terraform").terraformfmt,
                    function()
                        vim.lsp.buf.format({async = true})
                    end
                },
                ["lua"] = {
                    require("formatter.filetypes.lua").luaformat,
                    function()
                        vim.lsp.buf.format({async = true})
                    end
                },
                ["nix"] = {require("formatter.filetypes.nix").alejandra},
                ["json"] = {require("formatter.filetypes.json").prettier},
                ["javascript"] = {
                    require("formatter.filetypes.javascript").prettier
                },
                ["typescript"] = {
                    require("formatter.filetypes.typescript").prettier
                },
                ["svelte"] = {

                    function()
                        return {
                            exe = "prettier",
                            args = {
                                "--stdin-filepath",
                                util.escape_path(
                                    util.get_current_buffer_file_path()),
                                "--single-quote", "--tab-width", "2",
                                "--print-width", "80", "--trailing-comma",
                                "es5", "--no-semi"
                            },
                            stdin = true
                        }
                    end

                }
            }
        })

        -- Add formatting on save
        local augroup = vim.api.nvim_create_augroup
        local autocmd = vim.api.nvim_create_autocmd
        augroup("__formatter__", {clear = true})
        autocmd("BufWritePost",
                {group = "__formatter__", command = ":FormatWrite"})
    end
}

return init

-- Remap
-- vim.keymap.set("n",
-- 	"<leader>/",
-- function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end
