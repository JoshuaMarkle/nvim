return {
  -- Change colorscheme
  {
    -- Built upon onedark
    'JoshuaMarkle/playful.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  -- Highlight, edit and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- Colorize hex codes
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require("colorizer")
    end
  },
}
