return {
	'nvim-telescope/telescope.nvim',
	cmd = "Telescope",
	lazy = true,
    keys = {
		-- Files
    	{ "<leader>f", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
    	{ "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Find Files" },
    	{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find Text" },
    	{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },
		-- Git
		{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
		{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },	{ "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Find Diagnostics" },
    },
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = "make" },
	},
	config = function ()
		require('telescope').setup {
			defaults = {
				prompt_prefix = "   ",
				selection_caret = "  ",
				mappings = {
					i = {
						['<C-u>'] = false,
						['<C-d>'] = false,
					}
				}
			}
		}

		-- Enable telescope fzf native, if installed
		pcall(require('telescope').load_extension, 'fzf')
	end,
}
