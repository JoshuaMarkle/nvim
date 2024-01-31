-- Visualize tabs

return {
	'lukas-reineke/indent-blankline.nvim',
	lazy = true,
	event = 'BufReadPost',
	main = 'ibl',
	config = function()
		require('ibl').setup {
			scope = { enabled = true },
		}
	end,
}
