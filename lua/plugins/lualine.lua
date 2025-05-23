return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    theme = 'tokyonight',
  },
  config = function()
    require('lualine').setup {
      sections = {
        lualine_x = {
          -- Other lualine components in "x" section
          { require('mcphub.extensions.lualine') },
        },
      },
    }
  end
}
