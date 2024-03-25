-- Essentials
vim.keymap.set('n', '<leader>w', '<CMD>w<CR>', { desc = 'Save' })
vim.keymap.set('n', '<leader>W', '<CMD>SudaWrite<CR>', { desc = 'Save As Sudo' })
vim.keymap.set('n', '<leader>q', '<CMD>confirm q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>n', '<CMD>ene<CR>', { desc = 'New File' })

-- Buffer and Window Management
vim.keymap.set('n', '<leader>bh', '<CMD>split<CR>', { desc = 'Horizontal Split' })
vim.keymap.set('n', '<leader>bv', '<CMD>vsplit<CR>', { desc = 'Vertical Split' })
vim.keymap.set('n', '<leader>bc', '<CMD>bd<CR>', { desc = 'Close Buffer' })
vim.keymap.set('n', '<leader>br', '<CMD>wincmd H<CR>', { desc = 'Move Pane Right' })
vim.keymap.set('n', '<leader>bl', '<CMD>wincmd L<CR>', { desc = 'Move Pane Left' })
vim.keymap.set('n', '<leader>bu', '<CMD>resize -5<CR>', { desc = 'Resize Pane Up' })
vim.keymap.set('n', '<leader>bd', '<CMD>resize +5<CR>', { desc = 'Resize Pane Down' })
vim.keymap.set('n', '<leader>bl', '<CMD>vertical resize -5<CR>', { desc = 'Resize Pane Left' })
vim.keymap.set('n', '<leader>br', '<CMD>vertical resize +5<CR>', { desc = 'Resize Pane Right' })
vim.keymap.set('n', '<leader>bo', '<CMD>wincmd o<CR>', { desc = 'Toggle Full Window' })



-- Remap <C-d> and <C-u> to center screen
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- Ctrl-Backspace is awesome
vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', { noremap = true })

-- Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Select full file
vim.api.nvim_set_keymap('n', '<C-a>', 'gg<S-v>G', { noremap = true, silent = true })



-- Tmux sessionizer; create a floating window
vim.keymap.set('n', '<C-f>', function()
	vim.cmd 'ToggleTerm size=40 direction=float name="Tmux Sessionizer"'
	vim.cmd 'TermExec cmd="sessionizer || exit"'
end, { desc = 'Execute File' })
