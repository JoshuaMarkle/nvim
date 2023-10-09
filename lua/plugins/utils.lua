return {
	-- Tmux integration
	"christoomey/vim-tmux-navigator",

	-- Auto pair () [] {}
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
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
				-- theme = 'ayu-dark',
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
}
