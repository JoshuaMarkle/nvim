return {
	-- Tmux integration
	{
		"christoomey/vim-tmux-navigator",
		event = "VeryLazy",
	},

	-- Auto pair () [] {}
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = function()
			require('nvim-autopairs').setup({
				disable_filetype = { "tex" },
			})
		end
	},

	-- Visualize tabs
	{ 
		"lukas-reineke/indent-blankline.nvim", 
		main = "ibl", 
		config = function()
			require("ibl").setup {
				scope = { enabled = true },
			}
		end
	},

	-- Useful plugin to show you pending keybinds.
	{ 
		'folke/which-key.nvim', 
		enabled = true,
		opts = {} 
	},

	{
		'nvim-lualine/lualine.nvim',
		opts = {
			options = {
				icons_enabled = true,
				theme = "ayu_dark",
				component_separators = '|',
				section_separators = '',
			},
		},
	},

	-- "gc" to comment visual regions/lines
	--{ 'numToStr/Comment.nvim', opts = {} },

	-- Add a dashboard on open
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.theta'.config)
		end
	},

	-- Code runner
	{ 
		"CRAG666/code_runner.nvim", 
		config = true 
	},

	-- Firefox nvim stuff
	{
    'glacambre/firenvim',
    lazy = not vim.g.started_by_firenvim,
    build = function()
        vim.fn["firenvim#install"](0)
    end
	},

	  -- Notification
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      --dofile(vim.g.base46_cache .. "notify")
      require("notify").setup {
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "fade",
        timeout = 3000,
        top_down = true,
      }

      vim.notify = require "notify"
    end,
  },

	{
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

	{
		"NStefan002/speedtyper.nvim",
    cmd = "Speedtyper",
		config = function()
			require("speedtyper").setup({})
		end,
	},

}
