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
		enabled = enableFlutter and enableLsp,
	},

	{
		'natebosch/vim-lsc-dart',
		enabled = enableFlutter and enableLsp,
	},
}
