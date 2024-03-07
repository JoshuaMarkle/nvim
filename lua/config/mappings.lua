-- Remap <C-d> and <C-u> to center screen
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- Enter, Backspace, and Ctrl-Backspace is awesome
vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', { noremap = true })

-- Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Lazy
vim.api.nvim_set_keymap('n', '<leader>L', ':Lazy<CR>', { noremap = true })

-- select full file
vim.api.nvim_set_keymap('n', '<C-a>', 'gg<S-v>G', { noremap = true, silent = true })

-- Tmux sessionizer; create a temp window
vim.keymap.set('n', '<C-f>', function()
	vim.cmd 'ToggleTerm size=40 direction=float name="Tmux Sessionizer"'
	vim.cmd 'TermExec cmd="sessionizer || exit"'
end, { desc = 'Execute File' })
