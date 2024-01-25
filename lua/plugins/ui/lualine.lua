return {
	'nvim-lualine/lualine.nvim',
	lazy = false,
	-- event = 'VeryLazy',
	opts = {
		options = {
			icons_enabled = true,
			theme = 'tokyonight',
			component_separators = '|',
			-- section_separators = '',
			section_separators = { left = '', right = '' },
			-- component_separators = { left = '', right = '' },
		},
		color = { fg = 204 },
	},
}
