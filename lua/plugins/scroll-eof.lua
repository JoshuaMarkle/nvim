-- Adds space between last visible line and cursor

return {
	"Aasim-A/scrollEOF.nvim",
	config = function()
		require("scrollEOF").setup({
			pattern = "*",
			insert_mode = false,
			disable_filetypes = {},
		})
	end,
}
