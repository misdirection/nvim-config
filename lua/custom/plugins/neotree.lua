return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  vim.api.nvim_set_keymap('n', '\\', ':Neotree toggle current reveal_force_cwd<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<Leader>e', ':Neotree reveal<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<leader>b', ':Neotree toggle show buffers right<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<leader>s', ':Neotree float git_status<CR>', { noremap = true, silent = true }),
}
