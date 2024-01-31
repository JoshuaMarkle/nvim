return {
	'lewis6991/hover.nvim',
	lazy = enableHover,
	keys = {
		{ 'K', "<cmd>lua require('hover').hover()<CR>", desc = 'Hover' },
		{ ' k', "<cmd>lua require('hover').hover_select()<CR>", desc = 'Hover Select' },
		{ '<MouseMove>', "<cmd>lua require('hover').hover_mouse<cr>", desc = 'Hover Mouse' },
	},
	config = function()
		local hover_status_ok, hover = pcall(require, 'hover')
		if not hover_status_ok then
			print 'hover not found!'
		end
		hover.setup {
			init = function()
				require 'hover.providers.lsp'
				require 'hover.providers.gh'
				require 'hover.providers.gh_user'
				require 'hover.providers.jira'
				require 'hover.providers.man'
				require 'hover.providers.dictionary'
			end,
			preview_opts = {
				border = 'rounded',
			},
			preview_window = true,
			title = true,
		}
	end,
}
