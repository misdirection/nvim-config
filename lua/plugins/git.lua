return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      -- signs = {
      --   add = { text = '+' },
      --   change = { text = '~' },
      --   delete = { text = '_' },
      --   topdelete = { text = '‾' },
      --   changedelete = { text = '~' },
      -- },
      current_line_blame = true,
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git [c]hange' })

        -- Actions
        -- visual mode
        map('v', '<leader>gs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })
        map('v', '<leader>gr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })
        -- normal mode
        map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
        map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
        map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
        map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = 'git [u]ndo stage hunk' })
        map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
        map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
        map('n', '<leader>gb', gitsigns.blame_line, { desc = 'git [b]lame line' })
        map('n', '<leader>gd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
        map('n', '<leader>gD', function()
          gitsigns.diffthis '@'
        end, { desc = 'git [D]iff against last commit' })
        -- Toggles
        map('n', '<leader>tl', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
        map('n', '<leader>tD', gitsigns.toggle_deleted, { desc = '[T]oggle git show [D]eleted' })
      end,
    },
  },
  {
    "sindrets/diffview.nvim", -- optional - Diff integration
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons' },
    event = "BufRead",
    keys = {
      { "<leader>jj", "<cmd>set hidden<cr><cmd>DiffviewClose<cr><cmd>set nohidden<cr>" },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    event = "BufRead",
    config = function()
      require('neogit').setup({
        commit_popup = {
          kind = "split",
        },
        integrations = {
          diffview = true,
        },
      })
      vim.keymap.set('n', '<leader>do', function()
        -- Verwende Telescope, um Branches auszuwählen
        require('telescope.builtin').git_branches({
          attach_mappings = function(_, map)
            map('i', '<CR>', function(prompt_bufnr)
              local actions = require('telescope.actions')
              local state = require('telescope.actions.state')
              local selection = state.get_selected_entry(prompt_bufnr)
              actions.close(prompt_bufnr)

              -- Überprüfen, ob ein Branch ausgewählt wurde
              if selection and selection.value then
                -- Diffview öffnen mit dem Branch-Kontext
                vim.cmd("DiffviewOpen " .. selection.value)
              else
                print("Abgebrochen: Kein Branch ausgewählt.")
              end
            end)
            return true
          end,
        })
      end, { noremap = true, silent = true, desc = "Diffview: Open diff for current file and branch" })
    end,
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit", noremap = true, silent = true },
    },
  },
}
