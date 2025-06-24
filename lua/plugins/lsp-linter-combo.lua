return {
  {
    "williamboman/mason.nvim",
    config = function() require("mason").setup() end

  }, {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "williamboman/mason.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end
          })
        end
      end
    })
  end
}, {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.register(null_ls.builtins.formatting.terraform_fmt.with({
      command = "terraform",
      args = { "fmt", "-" },
      filetypes = { "terraform", "tf", "terraform-vars" },
    }))

    null_ls.register(null_ls.builtins.formatting.terraform_fmt.with({
      command = "lua-format",
      args = { "fmt", "-" },
      filetypes = { "lua", ".lua" },
    }))


    require("mason-null-ls").setup({
      automatic_installation = true,
      automatic_setup = true,
      handlers = {},
    })
  end
},
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup()
    end
  },
  { "neovim/nvim-lspconfig" }
}
