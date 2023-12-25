return {
	'gerazov/toggle-bool.nvim',
	lazy = true,
	keys = {
		{ "<leader>ct", "<cmd>lua require('toggle-bool').toggle_bool()<cr>", desc = "Toggle Booleans"},
	},
	opts = {
		additional_toggles = {
			Yes = 'No',
			On = 'Off',
			['0'] = '1',
			Enable = 'Disable',
			Enabled = 'Disabled',
			First = 'Last',
			Before = 'After',
			Allow = 'Deny',
			All = 'None',
		},
	},
}
