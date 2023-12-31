return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	lazy = true,
	keys = {
		{ '<leader>n', '<cmd>Neotree toggle<CR>', desc = 'Neotree Open' },
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
		'3rd/image.nvim',
	},
}
