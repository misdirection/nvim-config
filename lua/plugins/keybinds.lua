return {
  vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true }), -- CTRL + s to save
  vim.keymap.set('i', 'jj', '<ESC>', { noremap = true, silent = true }), -- jj to leave insert mode faster
  vim.keymap.set('n', '<C-c>', 'ggVG"+y', { noremap = true, silent = true }), -- CTRL + c to copy file to system clipboard
  vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true }), -- copy selection (v) to system clipboard
}
