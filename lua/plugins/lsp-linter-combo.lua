return {
    {
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end

    }, {
        "nvimtools/none-ls.nvim",
        event = {"BufReadPre", "BufNewFile"},
        dependencies = {"williamboman/mason.nvim", "nvim-lua/plenary.nvim"},
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({bufnr = bufnr})
                            end
                        })
                    end
                end
            })
        end
    }, {
        "jay-babu/mason-null-ls.nvim",
        event = {"BufReadPre", "BufNewFile"},
        dependencies = {"williamboman/mason.nvim", "nvimtools/none-ls.nvim"},
        config = function()
            require("mason-null-ls").setup({
                automatic_installation = true,
                automatic_setup = true,
                handlers = {
                    function(source_name, methods)
                        require("mason-null-ls.automatic_setup")(source_name,
                                                                 methods)
                    end
                }
            })
        end
    }, {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {"williamboman/mason.nvim"},
        config = function()
            require("mason-lspconfig").setup()

            require("mason-lspconfig").setup_handlers {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end
            }

        end
    }, {"neovim/nvim-lspconfig"}
}
