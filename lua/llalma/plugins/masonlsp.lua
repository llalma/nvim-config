return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig"
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {'rust_analyzer'}
          })

        local lspconfig = require('lspconfig')  
        require('mason-lspconfig').setup_handlers({
        function(server)
            lspconfig[server].setup({})
        end,
        })
        
        vim.diagnostic.config({
            update_in_insert = true
          })

    end
}