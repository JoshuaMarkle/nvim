return {
	'folke/which-key.nvim',
	keys = {{ "<leader>" }},
	opts = function()
		return {
			plugins = {
				marks = true, -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 25, -- how many suggestions should be shown in the list?
				},
				presets = {
					operators = true, -- adds help for operators like d, y, ...
					motions = true, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = true, -- bindings for prefixed with g
				},
			},
			defaults = {
				mode = { 'n', 'v' },
				['<Leader>n'] = { name = '+Explorer' },
				['<Leader>b'] = { name = '+Buffer' },
				['<Leader>c'] = { name = '+Code' },
				['<Leader>f'] = { name = '+Find' },
				['<Leader>F'] = { name = '+Flutter' },
				['<Leader>g'] = { name = '+Git' },
				['<Leader>l'] = { name = '+Lazy' },
				['<Leader>L'] = { name = '+LaTeX' },
				['<Leader>m'] = { name = '+Markdown' },
				['<Leader>r'] = { name = '+Run' },
				['<Leader>R'] = { name = '+R Markdown' },
			},
		}
	end,
	config = function(_, opts)
		local wk = require 'which-key'
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
