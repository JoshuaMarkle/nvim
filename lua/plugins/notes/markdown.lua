return {
	-- Essential markdown features
	{
		'tadmccorkle/markdown.nvim',
		lazy = true,
		ft = { 'markdown' },
		opts = {
			mappings = {
				inline_surround_toggle = 'gs', -- (string|boolean) toggle inline style
				inline_surround_toggle_line = 'gss', -- (string|boolean) line-wise toggle inline style
				inline_surround_delete = 'ds', -- (string|boolean) delete emphasis surrounding cursor
				inline_surround_change = 'cs', -- (string|boolean) change emphasis surrounding cursor
				link_add = 'gl', -- (string|boolean) add link
				link_follow = 'gx', -- (string|boolean) follow link
				go_curr_heading = ']c', -- (string|boolean) set cursor to current section heading
				go_parent_heading = ']p', -- (string|boolean) set cursor to parent section heading
				go_next_heading = ']]', -- (string|boolean) set cursor to next section heading
				go_prev_heading = '[[', -- (string|boolean) set cursor to previous section heading
			},
			inline_surround = {
				emphasis = {
					key = 'i',
					txt = '*',
				},
				strong = {
					key = 'b',
					txt = '**',
				},
				strikethrough = {
					key = 's',
					txt = '~~',
				},
				code = {
					key = 'c',
					txt = '`',
				},
			},
			link = {
				paste = {
					enable = true, -- whether to convert URLs to links on paste
				},
			},
			toc = {
				-- Comment text to flag headings/sections for omission in table of contents.
				omit_heading = 'toc omit heading',
				omit_section = 'toc omit section',
			},
			-- Hook functions allow for overriding or extending default behavior.
			hooks = {
				follow_link = 'dest', -- nil
			},
		},
	},

	-- Toggle markdown checkboxes
	{
		'nfrid/markdown-togglecheck',
		dependencies = { 'nfrid/treesitter-utils' },
		lazy = true,
		ft = { 'markdown' },
		config = function()
			vim.keymap.set('n', '<leader>mt', require('markdown-togglecheck').toggle, { desc = 'Markdown Toggle Checkbox' })
		end,
	},

	-- Evalutate markdown code blocks
	{
		'jubnzv/mdeval.nvim',
		lazy = true,
		ft = { 'markdown' },
		keys = {
			{ '<leader>mr', '<cmd>MdEval<CR>', desc = 'Markdown Run Code' },
		},
		opts = {
			require_confirmation = false,
			eval_options = {
				cpp = {
					command = { 'g++', '-o0' },
					default_header = [[
					#include <iostream>
					#include <vector>
					using namespace std;
					]],
				},
			},
		},
	},

	-- Markdown code bluck editeor 2
	{
		'AckslD/nvim-FeMaco.lua',
		lazy = true,
		ft = { 'markdown' },
		keys = {
			{ '<leader>mc', '<cmd>FeMaco<cr>', desc = 'Markdown Edit Code' },
		},
		config = function()
			require('femaco').setup {
				-- should prepare a new buffer and return the winid
				prepare_buffer = function(opts)
					local buf = vim.api.nvim_create_buf(false, false)
					return vim.api.nvim_open_win(buf, true, opts)
				end,
				-- should return options passed to nvim_open_win
				float_opts = function(code_block)
					-- Width and height
					local width = math.floor(vim.api.nvim_win_get_width(0) * 0.6)
					local height = math.floor(vim.api.nvim_win_get_height(0) * 0.6) --#code_block.lines
					width = math.min(math.max(width, 5), vim.api.nvim_win_get_width(0) - 10)
					height = math.min(math.max(height, 5), vim.api.nvim_win_get_height(0) - 6)

					-- Rows and columns
					local ui = vim.api.nvim_list_uis()[1]
					local row = math.floor((ui.height / 2) - (height / 2))
					local col = math.floor((ui.width / 2) - (width / 2))

					-- Buffer parameters
					return {
						relative = 'editor',
						width = width,
						height = height,
						row = row,
						col = col,
						anchor = 'NW',
						style = 'minimal',
						border = 'rounded',
						zindex = 99,
					}
				end,
				-- return filetype to use for a given lang
				ft_from_lang = function(lang)
					return lang
				end,
				-- what to do after opening the float
				post_open_float = function(winnr)
					vim.wo.signcolumn = 'no'
				end,
				-- create the path to a temporary file
				create_tmp_filepath = function(filetype)
					return os.tmpname()
				end,
				ensure_newline = function(base_filetype)
					return false
				end,
				normalize_indent = function(base_filetype)
					return false
				end,
			}
		end,
	},

	-- Realtime equation viewer
	{
		'jbyuki/nabla.nvim',
		enabled = false,
		lazy = true,
		ft = { 'tex', 'markdown' },
		keys = {
			{ '<leader>me', "<cmd>lua require('nabla').popup({ border='rounded' })<cr>", desc = 'Equation Preview' },
		},
		config = function()
			require('nabla').enable_virt {
				autogen = true,
				silent = true,
			}
		end,
	},

	-- Highlight code and other things
	{
		'lukas-reineke/headlines.nvim',
		ft = { 'markdown', 'rmd' },
		config = function()
			-- PERF: schedule to prevent headlines slowing down opening a file
			vim.schedule(function()
				require('headlines').setup {
					markdown = {
						query = vim.treesitter.parse_query(
							'markdown',
							[[
								(fenced_code_block) @codeblock
							]]
						),
						codeblock_highlight = 'CodeBlock',
					},
					rmd = {
						query = vim.treesitter.parse_query(
							'markdown',
							[[
								(fenced_code_block) @codeblock
							]]
						),
						treesitter_language = 'markdown',
						codeblock_highlight = 'CodeBlock',
					},
				}
				require('headlines').refresh()
			end)

			require('headlines').setup {}
		end,
	},
}
