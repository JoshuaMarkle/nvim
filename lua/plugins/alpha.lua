-- Add a dashboard on open

return {
	'goolord/alpha-nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function ()
		require'alpha'.setup(require'alpha.themes.theta'.config)
	end
}
