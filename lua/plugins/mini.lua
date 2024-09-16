return { -- Collection of various small independent plugins/modules
  -- {
  --   'echasnovski/mini.nvim',
  --   config = function()
  --     require('mini.ai').setup { n_lines = 500 }
  --     vim.g.ministatusline_disable = true
  --   end,
  -- },
  {
    'echasnovski/mini.ai',
    version = false,
    config = function()
      require('mini.ai').setup {}
    end,
  },
  {
    'echasnovski/mini.move',
    version = false,
    config = function()
      require('mini.move').setup()
    end,
  },
  {
    'echasnovski/mini.animate',
    version = false,
    config = function()
      require('mini.animate').setup()
    end,
  },
  {
    'echasnovski/mini.jump',
    version = false,
    config = function()
      require('mini.jump').setup()
    end,
  },
}
