
init = {
      "kdheepak/lazygit.nvim",
      -- optional for floating window border decoration
      dependencies = {
          "nvim-lua/plenary.nvim",
      },
  }

-- Remap
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>")

-- Set mappings
local wk = 
require("which-key").register({ ["<leader>"] = {
    g = {
      name = "Git",
    },
  } 
})

return init