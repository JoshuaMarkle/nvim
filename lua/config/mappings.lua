-- Remap <C-d> and <C-u> to center screen
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'tt', "<cmd>lua require('nvterm.terminal').toggle('vertical')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'th', "<cmd>lua require('nvterm.terminal').toggle('horizontal')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'tf', "<cmd>lua require('nvterm.terminal').toggle('float')<CR>", { noremap = true, silent = true })
