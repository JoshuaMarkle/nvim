return {
	'folke/noice.nvim',
	lazy = true,
	event = 'VeryLazy',
	enabled = enableNoice,
	dependencies = {
		'MunifTanjim/nui.nvim',
	},
	opts = {
		lsp = {
			override = {
				['vim.lsp.util.convert_input_to_markdown_lines'] = true,
				['vim.lsp.util.stylize_markdown'] = true,
				['cmp.entry.get_documentation'] = true,
			},
			signature = {
				enabled = false,
			},
			progress = {
				enabled = false,
			},
			message = {
				enabled = false,
			},
			hover = {
				enabled = false,
			},
		},
		presets = {
			long_message_to_split = true,
			lsp_doc_border = true,
			bottom_search = true,
		},
		routes = {
			{
				filter = {
					event = 'notify',
					min_height = 10,
				},
				view = 'split',
			},
			{
				filter = {
					event = 'msg_show',
					any = {
						{ find = '%d+L, %d+B' },
						{ find = '; after #%d+' },
						{ find = '; before #%d+' },
					},
				},
				view = 'mini',
			},
		},
		cmdline = {
			format = {
				cmdline = { pattern = '^:', icon = '󰞷', lang = 'vim' },
			},
		},
			views = {
				mini = {
					win_options = {
						winblend = 0,
					},
				},
				cmdline_popup = {
					position = {
						row = 1,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
				},
				popupmenu = {
					relative = "editor",
					position = {
						row = 4,
						col = "50%",
					},
					size = {
						width = 60,
						height = 10,
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
		},
	},
}
