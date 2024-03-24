return {
    dir = "plugins.custom.search",
    lazy = false,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"grapp-dev/nui-components.nvim",
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
