
-- Setup plugin
init =  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
	"nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("nvim-tree").setup {}
    end
}

-- Remap
vim.keymap.set({"n"}, "<leader>o", "<cmd>NvimTreeOpen<cr>", {desc="Toggle File Explorer"})

return init
