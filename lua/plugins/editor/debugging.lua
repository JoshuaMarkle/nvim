-- A bunch of debugging help

return {
	-- GitHub tests
	{
		"nvim-neotest/neotest",
		lazy = true,
		ft = {
			"python",
			"cpp"
		},
		dependencies = {
			"alfaix/neotest-gtest",
			"nvim-neotest/neotest-python",
			"antoinemadec/FixCursorHold.nvim",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-gtest").setup({}),
					require("neotest-python"),
				}
			})
		end,
	}
}
