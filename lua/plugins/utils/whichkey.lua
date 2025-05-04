return {
	'folke/which-key.nvim',
	lazy = true,
	keys = { { '<leader>' } },
	dependencies = { 'echasnovski/mini.icons' },
	opts = {
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 25,
			},
			presets = {
				operators = true,
				motions = true,
				text_objects = true,
				windows = true,
				nav = true,
				z = false,
				g = false,
			},
		},
		icons = { group = "", separator = "" },
		disable = { filetypes = { "TelescopePrompt" } },
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- ✅ Call `add()` to define your mappings
		wk.add({
			{ "<Leader>u", group = "󰍉 Find" },
			{ "<Leader>h", group = "󰦨 Harpoon" },
			{ "<Leader>g", group = "󰊢 Git" },
			{ "<Leader>l", group = " LSP" },
			{ "<Leader>t", group = " Terminal" },
			{ "<Leader>b", group = "󰓩 Buffer" },
			{ "<Leader>m", group = " Markdown" },
			{ "<Leader>r", group = " Rstudio" },
			{ "<Leader>L", group = "󱗆 LaTeX" },
			{ "<Leader>f", group = "󰀲 Flutter" },
			{ "<Leader>fp", group = "󰏖 Pub" },
		}, { mode = { "n", "v" } })
	end,
}
