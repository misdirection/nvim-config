return {
  'mbbill/undotree',
  config = function()
    -- Optional: Tastenbelegung oder zusätzliche Konfiguration
    vim.keymap.set('n', '<leader>tu', ':UndotreeToggle<CR>', { noremap = true, silent = true })
  end
}
