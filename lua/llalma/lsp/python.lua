require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'E302', 'E301', 'W391'},
        }
      }
    }
  }
}
