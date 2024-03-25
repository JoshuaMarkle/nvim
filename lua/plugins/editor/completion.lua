-- Autocompletion

return {
	'hrsh7th/nvim-cmp',
	enabled = enableCompletions,
	lazy = true,
	event = { 'InsertEnter', 'CmdlineEnter' },
	dependencies = {
		'L3MON4D3/LuaSnip',

		-- Nice snippets
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-calc',
		'rafamadriz/friendly-snippets',

		-- Adds LSP completion capabilities
		{
			'hrsh7th/cmp-nvim-lsp',
			config = function()
				local cmpLspActive = pcall(require, 'cmp_nvim_lsp')
				if cmpLspActive then
					local capabilities = vim.lsp.protocol.make_client_capabilities()
					capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
				end
			end,
		},
	},
	config = function()
		local cmpActive = pcall(require, 'cmp')
		if cmpActive then
			local cmp = require 'cmp'
			local luasnip = require 'luasnip'
			require('luasnip.loaders.from_vscode').lazy_load()
			luasnip.config.setup {}

			-- Custom highlights
			vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { bg = 'NONE', fg = '#ff7a93' })
			vim.api.nvim_set_hl(0, 'CmpItemKindText', { bg = 'NONE', fg = '#1abc9c' })
			vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { link = 'Directory' })
			vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })

			local icons = {
				Text = '',
				Method = '󰆧',
				Function = '󰊕',
				Constructor = '',
				Field = '󰇽',
				Variable = '󰂡',
				Class = '󰠱',
				Interface = '',
				Module = '',
				Property = '󰜢',
				Unit = '',
				Value = '󰎠',
				Enum = '',
				Keyword = '󰌋',
				Snippet = '',
				Color = '󰏘',
				File = '󰈙',
				Reference = '',
				Folder = '󰉋',
				EnumMember = '',
				Constant = '󰏿',
				Struct = '',
				Event = '',
				Operator = '󰆕',
				TypeParameter = '󰅲',
			}

			local function border(hl_name)
				return {
					{ '╭', hl_name },
					{ '─', hl_name },
					{ '╮', hl_name },
					{ '│', hl_name },
					{ '╯', hl_name },
					{ '─', hl_name },
					{ '╰', hl_name },
					{ '│', hl_name },
				}
			end

			cmp.setup {
				formatting = {
					fields = { 'abbr', 'kind' },
					format = function(entry, vim_item)
						vim_item.kind = string.format('%s %s', icons[vim_item.kind], vim_item.kind)
						return vim_item
					end,
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert {
					['<C-n>'] = cmp.mapping.select_next_item(),
					['<C-p>'] = cmp.mapping.select_prev_item(),
					['<C-d>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete {},
					['<CR>'] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					},
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { 'i', 's' }),
				},
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'buffer' },
					{ name = 'paths' },
					{ name = 'calc' },
				},
				window = {
					completion = {
						side_padding = 1,
						winhighlight = 'Normal:Directory,CursorLine:Directory,Search:Directory',
						scrollbar = false,
						border = border 'LineNr',
					},
					documentation = {
						border = border 'LineNr',
						winhighlight = 'Normal:Directory',
					},
				},
			}
		end
	end,
}
