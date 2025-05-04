local S = require("explorer.state")
local KM = require("explorer.keymap")

local M = {}

-- public
function M.open(path)
	if not path or path=="" then
		local cur = vim.api.nvim_buf_get_name(0)
		path = (cur~="") and vim.fn.fnamemodify(cur,":p:h") or S.uv.cwd()
	end

	S.ns = S.ns or vim.api.nvim_create_namespace("explorer")

	if not S.buf or not vim.api.nvim_buf_is_valid(S.buf) then
		S.buf = vim.api.nvim_create_buf(false,true)
		vim.bo[S.buf].bufhidden, vim.bo[S.buf].filetype = "wipe","explorer"
		S.win = vim.api.nvim_get_current_win()
		vim.api.nvim_win_set_buf(S.win,S.buf)
		KM.attach()
	else
		vim.api.nvim_set_current_win(S.win)
	end

	KM.open_dir(path)
end

return M
