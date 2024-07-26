local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{ import = 'plugins.ui' },
	{ import = 'plugins.editor' },
	{ import = 'plugins.lsp' },
	{ import = 'plugins.git' },
	{ import = 'plugins.utils' },
	{ import = 'plugins.notes' },
	-- { import = 'plugins.custom' },
}, {
	defaults = {
		lazy = true,
	},
	checker = {
		enabled = true,
		notify = false,
	},
	ui = {
		border = 'rounded',
	},
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				'netrw',
				'netrwPlugin',
				'netrwSettings',
				'netrwFileHandlers',
				'gzip',
				'zip',
				'zipPlugin',
				'tar',
				'tarPlugin',
				'getscript',
				'getscriptPlugin',
				'vimball',
				'vimballPlugin',
				'2html_plugin',
				'logipat',
				'rrhelper',
				'spellfile_plugin',
				'matchit',
				'matchparen',
				'tohtml',
				'tutor',
				'rplugin',
				'synmenu',
				'optwin',
				'compiler',
				'bugreport',
				'ftplugin',
			},
		},
	},
})
