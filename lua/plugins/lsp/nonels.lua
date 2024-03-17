return {
	'nvimtools/none-ls.nvim',
	enabled = enableLsp,
	lazy = true,
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'jay-babu/mason-null-ls.nvim',
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.completion.spell,
			},
		})
	end,
}
