-- Toggle term has more terminal features

return {
	'akinsho/toggleterm.nvim',
	version = '*',
	lazy = false,
	keys = {
		vim.keymap.set({ 'n', 't' }, '<leader>tm', '<CMD>ToggleTerm size=60 direction=vertical name=toggleterm<CR>', { desc = 'Open Terminal' }),
		vim.keymap.set({ 'n', 't' }, '<leader>tt', function()
			-- Go back to previous buffer if currently in terminal
			if vim.bo.filetype == "toggleterm" then
				vim.cmd("wincmd p")
				return
			end
			local terminals = require("toggleterm.terminal").get_all()
			-- Create a new terminal if there are none
			if #terminals == 0 then
				vim.cmd("ToggleTerm size=60 direction=vertical name=toggleterm")
				terminals = require("toggleterm.terminal").get_all()
			end
			-- Focus on the first terminal and enter insert mode
			local firstTerm = terminals[1]
			if firstTerm:is_open() then
				firstTerm:focus()
			else
				firstTerm:open()
			end
			vim.cmd("startinsert")
		end, { desc = 'Focus Terminal' }),
		vim.keymap.set({ 'n', 't' }, '<leader>tc', function()
			local terminals = require("toggleterm.terminal").get_all()
			if #terminals == 0 then
				vim.cmd("ToggleTerm size=60 direction=vertical name=toggleterm")
			end
			vim.cmd('TermExec cmd=""')
			vim.cmd('TermExec cmd="clear"')
			end, { desc = 'Clear Terminal' })
	},
	config = function()
		require('toggleterm').setup()
	end,
}
