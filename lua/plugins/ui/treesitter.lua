-- Highlight, edit, and navigate code

return {
	'nvim-treesitter/nvim-treesitter',
	event = 'BufRead',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup {
			-- Specify languages to be installed
			auto_install = true,
			ensure_installed = {
				'c',
				'cpp',
				'python',
				'lua',
				'html',
				'css',
				'javascript',
				'typescript',
				'tsx',
				'vim',
				'vimdoc',
				'bash',
				'json',
				'markdown',
				'markdown_inline',
				'latex',
			},

			highlight = {
				enable = true,
				disable = { 'latex' },
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					-- init_selection = "<c-space>",
					-- node_incremental = "<c-space>",
					-- scope_incremental = "<c-s>",
					-- node_decremental = "<M-space>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						-- ["aa"] = "@parameter.outer",
						-- ["ia"] = "@parameter.inner",
						-- ["af"] = "@function.outer",
						-- ["if"] = "@function.inner",
						-- ["ac"] = "@class.outer",
						-- ["ic"] = "@class.inner",
					},
				},
				-- move = {
				-- 	enable = true,
				-- 	set_jumps = true, -- whether to set jumps in the jumplist
				-- 	goto_next_start = {
				-- 		["]m"] = "@function.outer",
				-- 		["]]"] = "@class.outer",
				-- 	},
				-- 	goto_next_end = {
				-- 		["]M"] = "@function.outer",
				-- 		["]["] = "@class.outer",
				-- 	},
				-- 	goto_previous_start = {
				-- 		["[m"] = "@function.outer",
				-- 		["[["] = "@class.outer",
				-- 	},
				-- 	goto_previous_end = {
				-- 		["[M"] = "@function.outer",
				-- 		["[]"] = "@class.outer",
				-- 	},
				-- },
				-- swap = {
				-- 	enable = true,
				-- 	swap_next = {
				-- 		["<leader>a"] = "@parameter.inner",
				-- 	},
				-- 	swap_previous = {
				-- 		["<leader>A"] = "@parameter.inner",
				-- 	},
				-- },
			},
		}

		-- Diagnostic keymaps
		-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
		-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
		-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
		-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
	end,
}
