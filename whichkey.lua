return {}
-- Load Plugin
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        -- Configs and mappings
        require("llalma.Configs.whichkey")
    end, 
}