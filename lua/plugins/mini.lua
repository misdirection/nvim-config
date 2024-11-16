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
    opts = function(_, opts)
      -- Add ESC keymap to clear highlights and stop jumping
      local MiniJump = require('mini.jump')
      vim.keymap.set('n', '<Esc>', function()
        vim.cmd('noh')
        -- Stop mini.jump if available
        if MiniJump.stop_jumping then
          MiniJump.stop_jumping()
        end
      end, { noremap = true, silent = true, desc = "ESC: Clear search and stop mini.jump" })

      return opts
    end,
  },
  {
    'echasnovski/mini.diff',
    version = false,
    opts = {},
  },
  {
    'echasnovski/mini.icons',
    version = false,
    opts = {},
  },
}
