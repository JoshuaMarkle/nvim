-- Set the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.hlsearch = false -- Set highlight on search
vim.o.incsearch = true
vim.o.autowrite = true -- Enable auto writes
vim.o.cursorline = true
vim.wo.number = true -- Make line numbers
vim.wo.relativenumber = false
vim.o.scrolloff = 8 -- Set scrolloff for nice scrolling
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.o.breakindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.wo.wrap = true
vim.wo.linebreak = true
vim.o.undofile = true
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.termguicolors = true -- NOTE: You should make sure your terminal supports this
vim.o.swapfile = false
vim.o.splitbelow = true
vim.o.splitright = true

-- Auto zen-mode in markdown files
-- vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
-- 	pattern = '*.md',
-- 	callback = function()
-- 		vim.cmd('ZenMode')
-- 	end
-- })
