return {
	'williamboman/mason.nvim',
	enabled = enableMason,
	event = { 'BufReadPost', 'BufNewFile' },
	lazy = true,
	dependencies = {
		{ 'williamboman/mason-lspconfig.nvim', cmd = { 'LspInstall', 'LspUninstall' } },
		'WhoIsSethDaniel/mason-tool-installer.nvim',
	},
	opts = {
		ensure_installed = {
			'stylua',
			'spellcheck',
			'shfmt',
			'black',
			'isort',
			'flake8',
			'ruff',
			'eslint_d',
			'luacheck',
		},
	},
	config = function()
		local mason_status_ok, mason = pcall(require, 'mason')
		if not mason_status_ok then
			print 'mason not found!'
		end
		local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
		if not mason_lspconfig_status_ok then
			print 'mason-lspconfig not found!'
		end

		local mason_tool_installer = require 'mason-tool-installer'

		mason.setup {
			ui = {
				icons = {
					package_installed = ' ',
					package_uninstalled = '○ ',
					package_pending = ' ',
				},
			},
		}

		-- Language Processing Servers (LSPs)
		mason_lspconfig.setup {
			ensure_installed = {
				'tsserver',
				'html',
				'cssls',
				'lua_ls',
				'pyright',
				'marksman',
			},
			automatic_installation = true,
		}

		-- Formatting
		mason_tool_installer.setup {
			ensure_installed = {
				'prettier',
				'stylua',
				'isort',
				'black',
				'pylint',
				'eslint_d',
			},
		}
	end,
}
