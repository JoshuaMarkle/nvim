local enableLatex = true;

return {
	-- Enable latex support
	{
		'lervag/vimtex',
		enabled = enableLatex,
		lazy = true,
		ft = {"tex"},
		config = function ()
			vim.g.vimtex_view_method = 'zathura'
			vim.g.vimtex_view_general_viewer = 'zathura'
			vim.g.tex_flavour = 'latex'
		end
	},

	-- Add latex snippets
	{
		'sirver/ultisnips',
		enabled = enableLatex,
		lazy = true,
		ft = {"tex"},
		config = function ()
			vim.g.UltiSnipsSnippetsDir = '~/.config/nvim/ultisnips'
			vim.g['UltiSnipsSnippetDirectories'] = {'~/.config/nvim/ultisnips'}
			vim.g.UltiSnipsExpandTrigger = '<tab>'
			vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
			vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
		end
	},

	-- Realtime equation viewer
	{
		'jbyuki/nabla.nvim',
		enabled = enableLatex,
		lazy = true,
		ft = { "tex", "markdown" },
		keys = {
			{ "<leader>p", "<cmd>lua require('nabla').popup({ border='rounded' })<cr>", desc = "Preview Equation" },
		},
		config = function()
			require("nabla").enable_virt({
				autogen = true,
				silent = true,
			})
		end,
	}
}
