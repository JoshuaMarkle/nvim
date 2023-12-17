-- Notification system

return {
	"rcarriga/nvim-notify",
	enabled = false,
    event = "VeryLazy",
    config = function()
		--dofile(vim.g.base46_cache .. "notify")
		require("notify").setup {
    		level = 2,
        	minimum_width = 50,
        	render = "default",
        	stages = "fade",
			timeout = 3000,
    		top_down = true,
    	}

		vim.notify = require "notify"
    end,
 }
