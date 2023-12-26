return {
	'gerazov/toggle-bool.nvim',
	lazy = true,
	keys = {
		{ '<leader>ct', "<cmd>lua require('toggle-bool').toggle_bool()<cr>", desc = 'Toggle Booleans' },
	},
	opts = {
		additional_toggles = {
			['=='] = '!=',
			['and'] = 'or',
			['&&'] = '||',
			enable = 'disable',
			enabled = 'disabled',
			yes = 'no',
			on = 'off',
			['0'] = '1',
			first = 'last',
			before = 'after',
			all = 'none',
		},
	},
}
