-- Better term has better toggling (and code_runner support)

-- return {
-- 	'CRAG666/betterTerm.nvim',
-- 	lazy = false,
-- 	config = function()
-- 		require('betterTerm').setup {
-- 			prefix = 'terminal_',
-- 			startInserted = false,
-- 			position = 'vert',
-- 			size = 70,
-- 		}
--
-- 		local betterTerm = require 'betterTerm'
-- 		vim.keymap.set({ 'n', 't' }, '<leader>tm', betterTerm.open, { desc = 'Open Terminal' })
-- 		vim.keymap.set({ 'n' }, '<leader>tt', betterTerm.select, { desc = 'Select Terminal' })
-- 		local current = 2
-- 		vim.keymap.set({ 'n' }, '<leader>tn', function()
-- 			betterTerm.open(current)
-- 			current = current + 1
-- 		end, { desc = 'New Terminal' })
-- 	end,
-- }

-- Toggle term has more terminal features

return {
	'akinsho/toggleterm.nvim',
	version = '*',
	lazy = false,
	keys = {
		vim.keymap.set({ 'n' }, '<leader>tm', '<CMD>ToggleTerm size=60 direction=vertical<CR>', { desc = 'Open Terminal' }),
		vim.keymap.set({ 't' }, '<Esc>', '<CMD>ToggleTerm size=60 direction=vertical<CR>', { desc = 'Open Terminal' }),
	},
	config = function()
		require('toggleterm').setup()
	end,
}
