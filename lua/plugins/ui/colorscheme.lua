return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night",
			light_style = "day", -- The theme is used when the background is set to light
			transparent = false, -- Enable this to disable setting the background color
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				sidebars = "dark", -- style for sidebars, see below
				floats = "dark", -- style for floating windows
			},
			sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
			dim_inactive = false, -- dims inactive windows
			lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
		})
		vim.cmd("colorscheme tokyonight")
	end,
}

-- return {
-- 	'navarasu/onedark.nvim',
-- 	event = 'VeryLazy',
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require('onedark').setup {
-- 			-- Main options --
-- 			style = 'darker',
-- 			transparent = false,
-- 			term_colors = true,
-- 			ending_tildes = false,
-- 			cmp_itemkind_reverse = false,
--
-- 			code_style = {
-- 				comments = 'italic',
-- 				keywords = 'none',
-- 				functions = 'none',
-- 				strings = 'none',
-- 				variables = 'none',
-- 			},
--
-- 			-- Lualine options --
-- 			lualine = {
-- 				transparent = true,
-- 			},
--
-- 			-- Plugins Config --
-- 			diagnostics = {
-- 				darker = true,
-- 				undercurl = true,
-- 				background = true,
-- 			},
-- 		}
-- 		require('onedark').load()
-- 	end,
-- }

