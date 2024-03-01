return {
	-- Auto pair () [] {}
	{
		'windwp/nvim-autopairs',
		lazy = true,
		event = "InsertEnter",
		config = function()
			require('nvim-autopairs').setup({
				disable_filetype = { "tex" },
			})
		end,
	},

	-- Auto pair HTML and JSX
	{
		"windwp/nvim-ts-autotag",
		lazy = true,
		ft = { "html" },
		opts = {},
	},
}
