return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = require('config.local').treesitter_ensure_installed or {},
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = { enable = true, },
  },
  config = function(_, opts)
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)
  end,
}
