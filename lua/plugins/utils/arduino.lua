-- Adds arduino support

return {
	{
		'vlelo/arduino-helper.nvim',
		lazy = false,
		setup = function()
			require('arduino-helper').setup {
				ui = 'telescope',
			}
		end,
	},
}
