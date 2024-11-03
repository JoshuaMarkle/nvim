-- Essentials
-- vim.keymap.set('n', '<leader>w', '<CMD>w<CR>', { desc = 'Save' })
-- vim.keymap.set('n', '<leader>W', '<CMD>SudaWrite<CR>', { desc = 'Save As Sudo' })
vim.keymap.set('n', '<leader>q', '<CMD>confirm q<CR>', { desc = 'Quit' })
-- vim.keymap.set('n', '<leader>n', '<CMD>ene<CR>', { desc = 'New File' })

-- Remap <C-d> and <C-u> to center screen
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })



-- Tmux sessionizer; create a floating window
vim.keymap.set('n', '<C-f>', function()
	vim.cmd 'ToggleTerm size=40 direction=float name="Tmux Sessionizer"'
	vim.cmd 'TermExec cmd="sessionizer || exit"'
end, { desc = 'Execute File' })
