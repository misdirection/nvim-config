return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
  },
  keys = {
    -- Ihre Keymaps hier (wie zuvor besprochen)
    { '<leader>fh',       '<cmd>Telescope help_tags<cr>',    desc = '[F]ind [H]elp' },
    { '<leader>fk',       '<cmd>Telescope keymaps<cr>',      desc = '[F]ind [K]eymaps' },
    { '<leader>ff',       '<cmd>Telescope find_files<cr>',   desc = '[F]ind [F]iles' },
    { '<leader>fs',       '<cmd>Telescope builtin<cr>',      desc = '[F]ind [S]elect Telescope' },
    { '<leader>fw',       '<cmd>Telescope grep_string<cr>',  desc = '[F]ind current [W]ord' },
    { '<leader>fg',       '<cmd>Telescope live_grep<cr>',    desc = '[F]ind by [G]rep' },
    { '<leader>fd',       '<cmd>Telescope diagnostics<cr>',  desc = '[F]ind [D]iagnostics' },
    { '<leader>fr',       '<cmd>Telescope resume<cr>',       desc = '[F]ind [R]esume' },
    { '<leader>f.',       '<cmd>Telescope oldfiles<cr>',     desc = '[F]ind Recent Files ("." for repeat)' },
    { '<leader>fb',       '<cmd>Telescope git_branches<cr>', desc = '[F]ind [B]ranch' },
    { '<leader>fc',       '<cmd>Telescope git_commits<cr>',  desc = '[F]ind [C]ommit' },
    { '<leader><leader>', '<cmd>Telescope buffers<cr>',      desc = '[ ] Find existing buffers' },
    {
      '<leader>/',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      desc = '[/] Fuzzily search in current buffer',
    },
    {
      '<leader>f/',
      function()
        require('telescope.builtin').live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end,
      desc = '[F]ind [/] in Open Files',
    },
    {
      '<leader>fn',
      function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[F]ind [N]eovim files',
    },
  },
  opts = {
    defaults = {
      path_display = { 'smart' },
      layout_config = {
        prompt_position = 'top',
      },
      sorting_strategy = 'ascending',
      mappings = {
        i = {
          ['<C-s>'] = require('telescope.actions').select_horizontal,
          ['<C-v>'] = require('telescope.actions').select_vertical,
        },
        n = {
          ['<C-s>'] = require('telescope.actions').select_horizontal,
          ['<C-v>'] = require('telescope.actions').select_vertical,
        },
      },
    },
    extensions = {
      ['ui-select'] = {
        require('telescope.themes').get_dropdown(),
      },
    },
  },
  config = function(_, opts)
    local telescope = require('telescope')
    telescope.setup(opts)

    -- Laden der Erweiterungen, falls sie installiert sind
    pcall(telescope.load_extension, 'fzf')
    pcall(telescope.load_extension, 'ui-select')
  end,
}
