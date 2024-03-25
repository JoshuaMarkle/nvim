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
			desc = 'Dismiss All Notifications',
		},
	},
	config = function()
		require('notify').setup {
			level = 2,
			minimum_width = 50,
			max_width = 200,
			max_height = 10,
			fps = 60,
			render = 'compact',
			stages = 'slide',
			timeout = 6000,
			top_down = true,
		}

		vim.notify = require 'notify'
	end,
}
