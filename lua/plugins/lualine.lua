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
        lualine_c = {
          {
            "filename",
            file_status = true, -- [+] [RO]
            path = 1,           -- 0=only name, 1=relative path, 2=absolute
          }
        },
      },
    }
  end
}
