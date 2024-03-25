-- LSP configuration & plugins

return {
	'neovim/nvim-lspconfig',
	enabled = enableLsp,
	lazy = true,
	event = 'BufReadPre',
	dependencies = {
		-- Additional lua configuration
		{
			'folke/neodev.nvim',
			config = function()
				require('neodev').setup()
			end,
		},
		{
			'ray-x/lsp_signature.nvim',
			lazy = true,
			event = 'LspAttach',
		},
		'williamboman/mason-lspconfig.nvim',
	},
	keys = {
		-- Toggle the diagnostics
		vim.keymap.set('n', '<leader>lt', function()
			local config = vim.diagnostic.config
			local vt = config().virtual_text
			config {
				virtual_text = not vt,
			}
		end, { desc = "Toggle Diagnostics" })
	},
	config = function()
		-- Diagnostics
		local signs = {
			Error = '',
			Warn = '',
			Hint = '󰌵',
			Info = '',
		}

		for type, icon in pairs(signs) do
			local hl = 'DiagnosticSign' .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		vim.diagnostic.config {
			virtual_text = true,
			virtual_lines = true,
			float = {
				show_header = true,
				enabled = false,
				header = { '  Diagnostics' },
				source = 'always',
				border = 'rounded',
				focusable = false,
			},
			update_in_insert = true,
			signs = true,
			underline = false,
			severity_sort = false,
		}

		-- Enable the following language servers
		local servers = {
			clangd = {},
			pyright = {},
			-- rust_analyzer = {},
			-- gopls = {},
			-- tsserver = {},
			html = { filetypes = { 'html', 'twig', 'hbs' } },
			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
		}

		-- Setup Mason stuff
		require('mason').setup()
		local mason_lspconfig = require 'mason-lspconfig'

		mason_lspconfig.setup {
			ensure_installed = vim.tbl_keys(servers),
		}

		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		mason_lspconfig.setup_handlers {
			function(server_name)
				require('lspconfig')[server_name].setup {
					capabilities = capabilities,
					on_attach = function() end,
					settings = servers[server_name],
					filetypes = (servers[server_name] or {}).filetypes,
				}
			end,
		}
	end,
}
