return {
  -- Colorscheme
	{
		-- 'JoshuaMarkle/playful.nvim',
	  "JoshuaMarkle/neovim-ayu",
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme 'onedark'
			vim.cmd.colorscheme 'ayu-dark'
		end,
	},

	-- Beautify menu
	{
		'gelguy/wilder.nvim',
		config = function()
			local wilder = require('wilder')
			wilder.setup({modes = {':', '/', '?'}})

			wilder.set_option('renderer', wilder.popupmenu_renderer(
				wilder.popupmenu_border_theme({
					highlighter = wilder.basic_highlighter(),
					highlights = {
						default = wilder.make_hl('WilderNormal', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#B3B1AD', background = '#0A0E14'}}), -- highlight to use for the border
						border = wilder.make_hl('WilderBorder', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#B3B1AD', background = '#0A0E14'}}), -- highlight to use for the border
						accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#f4468f', background = '#0A0E14'}}),
					},

					-- Enable icons and disable scroll bar
					left = {' ', wilder.popupmenu_devicons()},
  				right = {' '},

					-- 'single', 'double', 'rounded' or 'solid'
					border = 'rounded',
					pumblend = 50,
				})
			))

		end,
	},

	-- Colorize hex codes
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup()
    end
  },

  -- Highlight, edit and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim' },

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = false,

        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<M-space>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
      }

      -- Diagnostic keymaps
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
    end
  },
}
