-- Format nasty looking code

return {
	'stevearc/conform.nvim',
	enabled = enableFormatter,
	lazy = true,
	event = 'BufRead',
	config = function()
		require('conform').setup {
			formatters_by_ft = {
				c = { 'clang_format' },
				cpp = { 'clang_format' },
				lua = { 'stylua' },
				python = { 'isort', 'black' },
				javascript = { 'prettier' },
				javascriptreact = { 'prettier' },
				typescript = { 'prettier' },
				typescriptreact = { 'prettier' },
				css = { 'prettier' },
				html = { 'prettier' },
				json = { 'prettier' },
				yaml = { 'prettier' },
				markdown = { 'prettier' },
				['*'] = { 'codespell' },
				['_'] = { 'trim_whitespace' },
			},
			format_on_save = {
				-- I recommend these options. See :help conform.format
				lsp_fallback = true,
				timeout_ms = 500,
			},
			format_after_save = {
				lsp_fallback = true,
			},
			-- Use `:ConformInfo` to see the log file.
			log_level = vim.log.levels.ERROR,
			notify_on_error = true,
		}
	end,
}
