-- LeetCode inside of neovim

return {
	'kawre/leetcode.nvim',
	enabled = false,
	cmd = 'Leet',
	keys = {
		{ '<leader>ll', '<CMD>Leet list<CR>', desc = 'Open Problem List' },
		{ '<leader>lt', '<CMD>Leet test<CR>', desc = 'Test Solution' },
		{ '<leader>ls', '<CMD>Leet submit<CR>', desc = 'Submit Solution' },
		{ '<leader>lh', '<CMD>Leet hints<CR>', desc = 'Show Hints' },
		{ '<leader>lc', '<CMD>Leet console<CR>', desc = 'Show Hints' },
	},
	dependencies = {
		'nvim-telescope/telescope.nvim',
		-- "ibhagwan/fzf-lua",
		'nvim-lua/plenary.nvim',
		'MunifTanjim/nui.nvim',
	},
	opts = {
		lang = 'python',
	},
}
