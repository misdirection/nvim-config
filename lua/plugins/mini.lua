return { -- Collection of various small independent plugins/modules
  -- {
  --   'echasnovski/mini.nvim',
  --
  --   config = function()
  --     require('mini.ai').setup { n_lines = 500 }
  --     vim.g.ministatusline_disable = true
  --   end,
  -- },
  {
    'echasnovski/mini.ai',
    version = false,
    opts = {},
  },
  {
    'echasnovski/mini.move',
    version = false,
    opts = {},
  },
  {
    'echasnovski/mini.animate',
    version = false,
    opts = {},
  },
  {
    'echasnovski/mini.jump',
    version = false,
    opts = {},
    keys = { 'n', '<ESC>', '<cmd>lua require("mini.jump").stop_jumping()<CR>' },
  },
  {
    'echasnovski/mini.diff',
    version = false,
    opts = {},
  },
}
