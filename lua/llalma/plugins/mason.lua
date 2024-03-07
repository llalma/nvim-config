return {
    "williamboman/mason.nvim",
    opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_uninstalled = "✗",
            package_pending = "⟳",
          },
        },
      },
    build = ":MasonUpdate",
	init = function()
		require("mason").setup()
		require("mason-lspconfig").setup()
	end
}
