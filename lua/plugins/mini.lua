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
      -- Füge eine Keymap für ESC hinzu
      vim.keymap.set('n', '<Esc>', function()
        -- Entferne Suchhervorhebungen
        vim.cmd('noh')
        MiniJump = require('mini.jump')
        -- Stoppe mini.jump
        if MiniJump ~= nil and MiniJump.stop_jumping() ~= nil then
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
