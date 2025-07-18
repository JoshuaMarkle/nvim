return {
	'norcalli/nvim-colorizer.lua',
	lazy = true,
	event = 'BufRead',
	config = function()
		require('colorizer').setup({
			'*', -- apply to all filetypes
		}, {
			RGB = true,
			RRGGBB = true,
			names = false,
			RRGGBBAA = true,
			rgb_fn = true,
			hsl_fn = true,
			css_fn = true,
			mode = 'background', -- or 'foreground'
		})
	end,
}
