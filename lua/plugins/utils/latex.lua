return {
	-- Enable latex support
	{
		'lervag/vimtex',
		enabled = enableLatex,
		lazy = false,
		ft = { 'tex' },
		config = function()
			vim.g.vimtex_view_method = 'zathura'
			vim.g.vimtex_view_general_viewer = 'zathura'
			vim.g.tex_flavour = 'latex'
		end,
	},

	-- Add latex snippets
	{
		'sirver/ultisnips',
		enabled = enableLatex,
		lazy = false,
		ft = { 'tex' },
		config = function()
			vim.g.UltiSnipsSnippetsDir = '~/.config/nvim/ultisnips'
			vim.g['UltiSnipsSnippetDirectories'] = { '~/.config/nvim/ultisnips' }
			vim.g.UltiSnipsExpandTrigger = '<tab>'
			vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
			vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
		end,
	},
}
