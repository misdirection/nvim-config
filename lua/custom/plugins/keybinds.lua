return {
  vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true }),
  vim.keymap.set('i', 'jj', '<ESC>', { noremap = true, silent = true }),
}
