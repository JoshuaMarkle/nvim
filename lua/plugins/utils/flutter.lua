local enableFlutter = true

return {
	-- Flutter support
	{
		'akinsho/flutter-tools.nvim',
		enabled = enableFlutter,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim',
		},
		config = function()
			require 'flutter-tools'
		end,
	},

	-- Flutter LSP
	{
		'natebosch/vim-lsc',
		enabled = enableFlutter,
	},

	{
		'natebosch/vim-lsc-dart',
		enabled = enableFlutter,
	},
}
