return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = function()
    local local_settings = require('config.local')
    local ensure = local_settings.treesitter_ensure_installed

    if type(ensure) ~= 'table' or vim.tbl_isempty(ensure) then
      ensure = {
        'lua',
        'vim',
        'vimdoc',
        'query',
        'markdown',
        'markdown_inline',
      }
    end

    return {
      ensure_installed = ensure,
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
    }
  end,
  config = function(_, opts)
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)
  end,
}
