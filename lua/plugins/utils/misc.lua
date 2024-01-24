return {
	-- Highlight cursor line
	{
		'yamatsum/nvim-cursorline',
		enabled = true,
		lazy = false,
		opts = {
			cursorline = {
				enable = true,
				timeout = 0,
				number = false,
			},
			cursorword = {
				enable = true,
				min_length = 3,
				hl = { underline = true },
			},
		},
	},

	-- Vim games
	{
		'ThePrimeagen/vim-be-good',
		lazy = true,
		cmd = 'VimBeGood',
	},
}
