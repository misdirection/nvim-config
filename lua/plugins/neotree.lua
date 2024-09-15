return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup({
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
    })
    vim.api.nvim_set_keymap('n', '\\', ':Neotree toggle current reveal_force_cwd<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>ee', ':Neotree toggle<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>eb', ':Neotree toggle show buffers right<CR>',
      { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>es', ':Neotree float git_status<CR>', { noremap = true, silent = true })
  end,
}
