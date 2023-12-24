-- Set the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Set scrolloff for nice scrolling
vim.o.scrolloff = 6

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Wrap text
vim.wo.wrap = true
vim.wo.linebreak = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Auto zen-mode in markdown files
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
	pattern = '*.md',
	callback = function()
		vim.cmd('ZenMode')
	end
})

