local uv = vim.loop

local M = {
  uv            = uv, -- expose for other modules
  buf           = nil,
  win           = nil,
  ns            = nil,
  current_path  = nil,
  entries       = {},
  breadcrumbs   = {},
  prev_cursor_hl= nil,
  prev_guicursor= nil,
}

function M.is_dir(e)   return e.type == "directory" end
function M.abs(e)      return M.current_path .. "/" .. e.name end
return M
