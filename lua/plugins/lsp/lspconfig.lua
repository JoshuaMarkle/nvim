-- LSP configuration & plugins

return {
	'neovim/nvim-lspconfig',
	enabled = enableLsp,
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		{
			'antosha417/nvim-lsp-file-operations',
			config = true,
		},
		{
			'ray-x/lsp_signature.nvim',
			event = 'LspAttach',
		},
	},
	keys = {
		vim.keymap.set('n', '<leader>lt', function()
			local config = vim.diagnostic.config
			local vt = config().virtual_text
			config {
				virtual_text = not vt,
			}
		end, { desc = 'Toggle Diagnostics' }),
	},
	config = function()
		vim.diagnostic.config {
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = '',
					[vim.diagnostic.severity.WARN] = '',
					[vim.diagnostic.severity.HINT] = '󰌵',
					[vim.diagnostic.severity.INFO] = '',
				},
			},
			virtual_text = true,
			virtual_lines = false,
			float = {
				show_header = true,
				header = { '  Diagnostics' },
				source = 'always',
				border = 'rounded',
				focusable = false,
			},
			update_in_insert = true,
			underline = false,
			severity_sort = true,
		}
	end,
}
