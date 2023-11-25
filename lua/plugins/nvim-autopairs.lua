-- Auto pair () [] {}

return {
	'windwp/nvim-autopairs',
	event = "InsertEnter",
	config = function()
		require('nvim-autopairs').setup({
			disable_filetype = { "tex" },
		})
	end,
}
