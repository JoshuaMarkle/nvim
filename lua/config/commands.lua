-- Add a confirmation to quitting (Change :q to :confirm q)
vim.cmd([[
	cnoreabbrev <expr> q  ((getcmdtype() ==# ':' && getcmdline() ==# 'q')  ? 'confirm q'  : 'q')
	cnoreabbrev <expr> qa ((getcmdtype() ==# ':' && getcmdline() ==# 'qa') ? 'confirm qa' : 'qa')
]])

-- Save with :w or :W (optional remapping for :W to :w to avoid errors)
vim.cmd([[
	cnoreabbrev <expr> W ((getcmdtype() ==# ':' && getcmdline() ==# 'W') ? 'w' : 'W')
]])
