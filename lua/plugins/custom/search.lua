return {
    dir = "plugins.custom.search",
    lazy = true,
	event = {
		'BufReadPre',
		'BufNewFile',
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"grapp-dev/nui-components.nvim",
		{
			"nvim-pack/nvim-spectre",
			config = function()
			  require("spectre").setup()
			end,
		},
	},
	keys = {
		{
			"<leader>s",
			function()
				require('plugins.custom.search.init').toggle()
			end,
			desc = "Search And Replace",
		},
	},

	config = function()
			end,
}
