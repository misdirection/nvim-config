return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ["l"] = "toggle_node",
          ["<Right>"] = "toggle_node",
          ["h"] = "close_node",
          ["<Left>"] = "close_node",
        },
      }
    },
  },
  keys = {
    { '\\',         ':Neotree toggle current reveal_force_cwd<CR>', desc = 'Reveal temp explorer', { noremap = true, silent = true } },
    { '<Leader>ee', ':Neotree focus filesystem<CR>',                desc = 'focus explorer',       { noremap = true, silent = true } },
    { '<Leader>ec', ':Neotree close<CR>',                           desc = 'close explorer',       { noremap = true, silent = true } },
    { '<Leader>em', ':Neotree toggle show<CR>',                     desc = 'Toggle show',          { noremap = true, silent = true } },
    { '<leader>eb', ':Neotree toggle show buffers right<CR>',       desc = 'Toggle Buffers right', { noremap = true, silent = true } },
    { '<leader>es', ':Neotree float git_status<CR>',                desc = 'Floating git status',  { noremap = true, silent = true } },
  },
}
