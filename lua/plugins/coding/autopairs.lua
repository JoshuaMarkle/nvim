-- Auto pair () [] {}

return {
	'windwp/nvim-autopairs',
	lazy = true,
	event = "InsertEnter",
	config = function()
		require('nvim-autopairs').setup({
			disable_filetype = { "tex" },
		})
	end,
}
