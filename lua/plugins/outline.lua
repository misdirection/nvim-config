return {
  {
    'hedyhli/outline.nvim',
    opts = {},
    keys = { { '<leader>to', '<cmd>Outline<CR>', desc = 'Toggle Outline' } },
  },

  {
    'stevearc/aerial.nvim',
    opts = {},
    keys = { { '<leader>ta', '<cmd>AerialToggle<CR>', desc = 'Toggle Aerial' } },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
}
