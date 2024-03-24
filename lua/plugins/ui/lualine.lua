return {
	'nvim-lualine/lualine.nvim',
	lazy = false,
	opts = {
		options = {
			icons_enabled = true,
			theme = 'tokyonight',
			component_separators = '|',
			section_separators = { left = '', right = '' },
		},
		color = { fg = 204 },
	},
}
