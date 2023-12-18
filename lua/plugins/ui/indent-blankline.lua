-- Visualize tabs

return {
	"lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    lazy = true,
	main = "ibl",
	config = function()
		require("ibl").setup {
			scope = { enabled = true },
		}
	end,
}
