return {
	name = "nvim-dap-virtual-text",
	dir = "$DAP_VIRTUAL_TEXT_DIR",
	build = false,
	event = "VeryLazy",
	dependencies = {
		{ name = "nvim-treesitter", dir = "$TREESITTER_DIR", build = false },
	},

	config = function()
		require("nvim-dap-virtual-text").setup()
	end,
}
