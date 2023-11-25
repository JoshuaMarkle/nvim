return {
	'navarasu/onedark.nvim',
	priority = 1000,
	config = function()
		require('onedark').setup  {
			-- Main options --
			style = 'darker',
			transparent = false,
			term_colors = true,
			ending_tildes = false,
			cmp_itemkind_reverse = false,

			code_style = {
					comments = 'italic',
					keywords = 'none',
					functions = 'none',
					strings = 'none',
					variables = 'none'
			},

			-- Lualine options --
			lualine = {
				transparent = true,
			},

			-- Plugins Config --
			diagnostics = {
				darker = true,
				undercurl = true,
				background = true,
			},
		}
		require('onedark').load()
	end,
}
