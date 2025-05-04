local S = require("explorer.state")
local uv = S.uv

local M = {}

function M.scandir(path)
	local h = uv.fs_scandir(path); if not h then return {} end
	local out = {}
	while true do
		local name, t = uv.fs_scandir_next(h); if not name then break end
		out[#out+1] = { name = name, type = t }
	end
	table.sort(out, function(a,b)
		if a.type ~= b.type then return a.type == "directory" end
		return a.name:lower() < b.name:lower()
	end)
	return out
end

function M.delete(entry)
	local ok = vim.fn.input("Delete " .. entry.name .. "? (y/n): ")
	if ok:lower() ~= "y" then return end
	vim.fn.delete(S.abs(entry), S.is_dir(entry) and "rf" or "")
end

function M.create(name)
	local f = io.open(S.current_path.."/"..name, "w"); if f then f:close() end
end

return M
