return {
	-- Zen Mode
	{
		'folke/zen-mode.nvim',
		lazy = true,
		cmd = 'ZenMode',
		keys = {
			{ '<leader>z', '<cmd>ZenMode<CR>', desc = 'Zen Mode' },
		},
		opts = {
			window = {
				backdrop = 0.5,
				width = 0.6,
				height = 1,
				options = {
					signcolumn = 'no', -- disable signcolumn
					number = false, -- disable number column
					relativenumber = false, -- disable relative numbers
					cursorline = false, -- disable cursorline
					cursorcolumn = false, -- disable cursor column
					foldcolumn = '0', -- disable fold column
					list = false, -- disable whitespace characters
				},
			},
			plugins = {
				options = {
					enabled = true,
					ruler = false,
					showcmd = false,
					laststatus = 0,
				},
				twilight = { enabled = true },
				gitsigns = { enabled = false },
				tmux = { enabled = true },
			},

			-- Custom code when Zen window opens
			on_open = function(win) end,
			-- Custom code when the Zen window closes
			on_close = function() end,
		},
	},
}
