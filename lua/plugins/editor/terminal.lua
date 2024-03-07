-- Toggle term has more terminal features

return {
	'akinsho/toggleterm.nvim',
	version = '*',
	lazy = false,
	keys = {
		vim.keymap.set({ 'n', 't' }, '<leader>tm', '<CMD>ToggleTerm size=60 direction=vertical<CR>', { desc = 'Open Terminal' }),
		-- vim.keymap.set({ 't' }, '<Esc>', '<CMD>ToggleTerm size=60 direction=vertical<CR>', { desc = 'Open Terminal' }),
	},
	config = function()
		require('toggleterm').setup()
	end,
}
