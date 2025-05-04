return {
	name = "explorer",
	dir = vim.fn.stdpath("config") .. "/lua/explorer",
	lazy = false,
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>e", function()
			require("explorer").open()
		end, { desc = "Open custom file explorer" })
	end,
}
