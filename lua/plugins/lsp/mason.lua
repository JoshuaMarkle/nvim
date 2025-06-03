-- Mason for installing LSP stuff

return {
	'williamboman/mason.nvim',
	enabled = enableLsp,
	event = { 'BufReadPost', 'BufNewFile' },
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		local mason = require 'mason'
		local mason_lspconfig = require 'mason-lspconfig'
		local mason_tool_installer = require 'mason-tool-installer'

		local on_attach = function(client, bufnr)
			local opts = { buffer = bufnr, silent = true }

			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
			vim.keymap.set('n', '<leader>lf', function()
				vim.lsp.buf.format { async = true }
			end, opts)
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

		mason_tool_installer.setup {
			ensure_installed = {
				'prettier',
				'stylua',
				'isort',
				'black',
				'pylint',
			},
		}

		mason_lspconfig.setup {
			ensure_installed = {
				'html',
				'cssls',
				'lua_ls',
				'pyright',
				'eslint',
			},

			automatic_installation = true,
			automatic_enable = {
				exclude = { 'lua_ls' },
			},

			-- Setup handlers with lspconfig
			handlers = {
				function(server_name)
					require('lspconfig')[server_name].setup {
						capabilities = require('cmp_nvim_lsp').default_capabilities(),
						on_attach = on_attach,
					}
				end,

				-- Override for Lua
				['lua_ls'] = function()
					require('lspconfig').lua_ls.setup {
						capabilities = require('cmp_nvim_lsp').default_capabilities(),
						on_attach = on_attach,
						settings = {
							Lua = {
								diagnostics = { globals = { 'vim', 'require' } },
								workspace = {
									checkThirdParty = false,
									library = {
										[vim.fn.expand '$VIMRUNTIME/lua'] = true,
										[vim.fn.stdpath 'config' .. '/lua'] = true,
									},
								},
								telemetry = { enable = false },
							},
						},
					}
				end,

				-- Override for eslint
				['eslint'] = function()
					require('lspconfig').eslint.setup {
						capabilities = require('cmp_nvim_lsp').default_capabilities(),
						on_attach = on_attach,
						root_dir = require('lspconfig.util').root_pattern('eslint.config.js', 'eslint.config.mjs', '.git'),
						settings = {
							workingDirectories = { mode = 'auto' },
							format = false, -- Prefer prettier formatting
						},
					}
				end,
			},
		}
	end,
}
