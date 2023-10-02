return {
  -- Tmux integration
  "christoomey/vim-tmux-navigator",

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Auto pair () [] {}
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },

  -- Useful plugin to show you pending keybinds.
  { 
    'folke/which-key.nvim', 
    enabled = true,
    opts = {} 
  },

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  -- "gc" to comment visual regions/lines
  --{ 'numToStr/Comment.nvim', opts = {} },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require("nvim-tree")
    end
  },

  -- Add a dashboard on open
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.theta'.config)
    end
  },

  {
    "NvChad/nvterm",
    config = function ()
      require("nvterm").setup()
    end,
  },
}
