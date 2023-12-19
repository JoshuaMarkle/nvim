return {
	-- Very useless but a good stress buster
	{
		"eandrju/cellular-automaton.nvim",
		lazy = true,
		keys = {
			{ "<leader>mc", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Make It Rain" },
		},
	},

	-- Illuminating equivalent words under the cursor
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPre", "BufNewFile" },
		lazy = true,
		opts = {
			delay = 300,
			large_file_cutoff = 5000,
		},
		config = function(_, opts)
			local status_ok, illuminate = pcall(require, "illuminate")
			if not status_ok then
			print("illuminate not found!")
			end
			illuminate.configure(opts)
		end,
	},

	-- Useless mouse lerp; looks good :D
	{
		"echasnovski/mini.animate",
		event = { "BufReadPost", "BufNewFile" },
		lazy = true,
		opts = function()
			local mouse_scrolled = false
			for _, scroll in ipairs({ "Up", "Down" }) do
				local key = "<ScrollWheel" .. scroll .. ">"
				vim.keymap.set({ "n", "i" }, key, function()
					mouse_scrolled = true
					return key
				end, { expr = true, desc = "Scroll " .. scroll })
			end	
			local animate_status_ok, animate = pcall(require, "mini.animate")
			if not animate_status_ok then
				print("mini.animate not found!")
			end
			return {
				resize = {
					timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
				},
				scroll = {
					timing = animate.gen_timing.linear({ duration = 75, unit = "total" }),
					subscroll = animate.gen_subscroll.equal({
					predicate = function(total_scroll)
						if mouse_scrolled then
						mouse_scrolled = false
						return false
						end
						return total_scroll > 1
					end,
					}),
				},
			}
		end,
	},
}
