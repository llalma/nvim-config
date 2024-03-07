
-- Setup plugin
init = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
      {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      require("telescope").setup({
        -- the rest of your telescope config goes here
        extensions = {
          undo = {},
          fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = 'smart_case' },
          ['ui-select'] = { require 'telescope.themes'.get_dropdown() }
        },
      })
      require("telescope").load_extension("undo")
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
    end,
  }

-- Remap
vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>")

vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<cr>", {})
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<cr>", {})

return init