-- Add a confirmation to quitting (Change :q to :confirm q)
vim.cmd [[
	cnoreabbrev <expr> q  ((getcmdtype() ==# ':' && getcmdline() ==# 'q')  ? 'confirm q'  : 'q')
	cnoreabbrev <expr> qa ((getcmdtype() ==# ':' && getcmdline() ==# 'qa') ? 'confirm qa' : 'qa')
]]

-- Save with :w or :W (optional remapping for :W to :w to avoid errors)
vim.cmd [[
	cnoreabbrev <expr> W ((getcmdtype() ==# ':' && getcmdline() ==# 'W') ? 'w' : 'W')
]]

-- Set the filetype when opening files (random bug I have)
vim.api.nvim_create_autocmd('BufWinEnter', {
	callback = function(args)
		if vim.bo[args.buf].filetype == '' then
			vim.cmd 'filetype detect'
		end
	end,
})
