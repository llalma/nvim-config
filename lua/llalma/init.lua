-- Load Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load the plugins
require("lazy").setup(
    {
      -- Make sure which key loads first so mappings can be added
      {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()  
            -- Configs and mappings
            require("llalma.Configs.whichkey")
        end, 
      },

      -- Load everything else
      {import = "llalma/plugins"}
    }
)

-- init remaps
require("llalma.remap")

-- init lsp
require("llalma.lsp.python")

-- colour scheme
vim.cmd 'colorscheme kanagawa'