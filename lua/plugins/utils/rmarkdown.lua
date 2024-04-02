return {
	{
		"R-nvim/R.nvim",
		enabled = enableR,
		lazy = false,
	},

	{
		"R-nvim/cmp-r",
		config = function()
			require("cmp_r").setup({})
		end,
	}
}
