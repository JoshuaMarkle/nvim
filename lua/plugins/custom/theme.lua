return {
	dir = vim.fn.stdpath 'config' .. '/lua/custom/theme',
	name = 'theme',
	lazy = false,
	priority = 1000,
	config = function()
		require('onedark').setup {
			style = 'light',
		}

		require('onedark').load()
	end,
}
