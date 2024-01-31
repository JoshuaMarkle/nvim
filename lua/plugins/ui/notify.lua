-- Notification system

return {
	'rcarriga/nvim-notify',
	enabled = enableNotifications,
	lazy = true,
	keys = {
		{
			'<leader>mn',
			function()
				require('notify').dismiss { silent = true, pending = true }
			end,
			desc = 'Dismiss all Notifications',
		},
	},
	config = function()
		require('notify').setup {
			level = 2,
			minimum_width = 50,
			render = 'default',
			stages = 'fade',
			timeout = 3000,
			top_down = true,
		}

		vim.notify = require 'notify'
	end,
}
