local S  = require("explorer.state")
local FS = require("explorer.fs")
local R  = require("explorer.render")

local M = {}

local function hide_cursor()
	if S.prev_cursor_hl then return end
	S.prev_cursor_hl = vim.api.nvim_get_hl(0, { name = "Cursor", link = false })
	vim.api.nvim_set_hl(0, "Cursor", { blend = 100 })
	S.prev_guicursor = vim.o.guicursor
	vim.o.guicursor = "a:Cursor/lCursor"
	vim.wo.cursorline = true
end

local function restore_cursor()
	if not S.prev_cursor_hl then return end
	vim.api.nvim_set_hl(0, "Cursor", S.prev_cursor_hl)
	vim.o.guicursor = S.prev_guicursor
	S.prev_cursor_hl = nil
end

local function goto_idx(i)
	vim.api.nvim_win_set_cursor(S.win, { i + 2, 0 })
end

local function idx_from_cursor()
	return vim.api.nvim_win_get_cursor(S.win)[1] - 2
end

local function open_dir(path, from_child)
	if S.current_path then
		S.breadcrumbs[S.current_path] = math.max(idx_from_cursor(), 0)
	end

	S.current_path = path
	S.entries = FS.scandir(path)
	R.refresh()

	local tgt = from_child and require("plenary.path").new(from_child):make_relative(path) or nil
	local idx = S.breadcrumbs[path] or 0

	if tgt then
		for i, e in ipairs(S.entries) do
			if e.name == tgt then
				idx = i - 1
				break
			end
		end
	end

	goto_idx(idx)
end

function M.attach()
	local function map(lhs, fn)
		vim.keymap.set("n", lhs, fn, { buffer = S.buf, silent = true, nowait = true })
	end

	map("q", function()
		restore_cursor()
		vim.api.nvim_win_close(S.win, true)
	end)

	map("j", "j")
	map("k", "k")

	map("l", function()
		local e = S.entries[idx_from_cursor() + 1]
		if not e then return end
		if S.is_dir(e) then
			open_dir(S.abs(e))
		else
			restore_cursor()
			vim.cmd.edit(vim.fn.fnameescape(S.abs(e)))
		end
	end)

	map("<CR>", "l")

	map("h", function()
		local p = vim.fn.fnamemodify(S.current_path, ":h")
		if p ~= S.current_path then open_dir(p, S.current_path) end
	end)

	map("d", function()
		local e = S.entries[idx_from_cursor() + 1]
		if not e then return end
		FS.delete(e)
		open_dir(S.current_path)
	end)

	local function add()
		local name = vim.fn.input("New file name: ")
		if name == "" then return end
		FS.create(name)
		open_dir(S.current_path)
	end

	map("o", function() add() end)
	map("a", function() add() end)
	map("O", function() add() end)

	vim.api.nvim_create_autocmd("CursorMoved", {

	})

	vim.api.nvim_create_autocmd({ "BufWipeout", "BufUnload" }, {
		buffer = S.buf,
		callback = restore_cursor,
	})

	hide_cursor()
end

M.open_dir = open_dir
return M
