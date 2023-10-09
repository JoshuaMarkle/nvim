local enablePlugins = false

return {
  -- Flutter support
  {
    "akinsho/flutter-tools.nvim",
		enabled = enablePlugins,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools")
    end
  },
 
  -- Flutter LSP
  {
		"natebosch/vim-lsc",
		enabled = enablePlugins,
	},

  {
		"natebosch/vim-lsc-dart",
		enabled = enablePlugins,
	},
}
