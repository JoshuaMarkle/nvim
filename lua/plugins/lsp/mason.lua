return {
	'williamboman/mason.nvim',
	event = { 'BufReadPost', 'BufNewFile' },
	lazy = true,
	dependencies = {
		{ 'williamboman/mason-lspconfig.nvim', cmd = { 'LspInstall', 'LspUninstall' } },
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
			'prettierd',
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
		local mason_null_ls_status_ok, mason_null_ls = pcall(require, 'mason-null-ls')
		if not mason_null_ls_status_ok then
			print 'mason-null-ls not found!'
		end

		mason.setup {
			ui = {
				icons = {
					package_installed = ' ',
					package_uninstalled = '○ ',
					package_pending = ' ',
				},
			},
		}
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
		mason_null_ls.setup {
			ensure_installed = {
				'prettierd',
				'stylua',
				'black',
				'isort',
				'ruff',
				'eslint_d',
				'luacheck',
			},
		}
	end,
}
