return {
	'nvim-lualine/lualine.nvim',
	lazy = false,
	config = function()
		local colors = {
			bg       = '#101319',
			fg       = '#c0caf5',
			white    = '#ffffff',
			grey     = '#3b4261',
		}

		local empty = require('lualine.component'):extend()
		function empty:draw(default_highlight)
			self.status = ''
			self.applied_separator = ''
			self:apply_highlights(default_highlight)
			self:apply_section_separators()
			return self.status
		end

		local function process_sections(sections)
			for name, section in pairs(sections) do
				local left = name:sub(9, 10) < 'x'
				for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
					table.insert(section, pos * 2, { empty, color = { fg = colors.bg, bg = colors.bg } })
				end
				for id, comp in ipairs(section) do
					if type(comp) ~= 'table' then
						comp = { comp }
						section[id] = comp
					end
					comp.separator = left and { right = '' } or { left = '' }
				end
			end
			return sections
		end

		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = 'tokyonight',
				component_separators = '',
				section_separators = { left = '', right = '' },
				globalstatus = true,
			},
			sections = process_sections {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = {
					{ 'filename', path = 1 },
				},
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'location' },
				lualine_z = { 'progress' },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {},
			},
		}
	end,
}
