local S = require("explorer.state")
local FS = require("explorer.fs")

local M = {}

local function icon(e)
	return S.is_dir(e) and " " or " "
end

local function header_hl(line)
	if type(line) ~= "string" or line == "" then return nil end
	local base = vim.fn.fnamemodify(S.current_path, ":t")
	local col = #line - #base
	if col < 0 then return nil end
	return { line = 0, col, col + #base, "Directory" }
end

function M.refresh()
	local lines, hls = {}, {}
	lines[1] = S.current_path
	local header = header_hl(lines[1])
	if header then table.insert(hls, header) end

	for i, e in ipairs(S.entries) do
		local l = icon(e) .. e.name
		lines[#lines + 1] = l
		if S.is_dir(e) then
			table.insert(hls, { i, 0, #l, "Directory" })
		end
	end

	vim.api.nvim_buf_set_lines(S.buf, 0, -1, false, lines)
	vim.api.nvim_buf_clear_namespace(S.buf, S.ns, 0, -1)
	for _, h in ipairs(hls) do
		local line, col_start, col_end, group = unpack(h)
		if type(line) == "number" and type(col_start) == "number" and type(col_end) == "number" then
			vim.api.nvim_buf_add_highlight(S.buf, S.ns, group, line, col_start, col_end)
		end
	end
end

return M
