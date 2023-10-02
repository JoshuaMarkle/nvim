return {
  -- Flutter support
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools")
    end
  },
 
  -- Flutter LSP
  "natebosch/vim-lsc",
  "natebosch/vim-lsc-dart",
}
