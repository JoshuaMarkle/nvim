-- A tab system for neovim buffers

return {
	'akinsho/bufferline.nvim',
	enabled = enableTabline,
	lazy = false,
	version = '*',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		require('bufferline').setup {
			options = {
				mode = 'buffers',
				separator_style = 'thick',
			},
		}
	end,
}
