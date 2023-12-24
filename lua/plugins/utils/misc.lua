return {
	-- Illuminating equivalent words under the cursor
	{
		"RRethy/vim-illuminate",
		enabled = false, -- Takes 12ms!
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

	-- Vim games
	{
		'ThePrimeagen/vim-be-good',
		lazy = true,
		cmd = "VimBeGood",
	}
}
