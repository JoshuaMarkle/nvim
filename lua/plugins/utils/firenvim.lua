-- Puts firefox in the browser

return {
	'glacambre/firenvim',
	enabled = enableFirenvim,
	lazy = not vim.g.started_by_firenvim,
	build = function()
		vim.fn['firenvim#install'](0)
	end,
}
