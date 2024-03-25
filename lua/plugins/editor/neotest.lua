-- Hopefully get this working in the future
return {
	"nvim-neotest/neotest",
	lazy = false,
	enabled = false,
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"alfaix/neotest-gtest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-gtest").setup({})
			}
		})
	end,
}
