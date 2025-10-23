return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'theHamsta/nvim-dap-virtual-text',
    {
      'mfussenegger/nvim-dap-python',
      ft = 'python',
      config = function(_)
        require('config.local').dap_python_config(_)
      end,
    },
  },
  keys = function(_, keys)
    local has_dap, dap = pcall(require, 'dap')
    if not has_dap then
      return keys or {}
    end

    local has_dapui, dapui = pcall(require, 'dapui')
    keys = keys or {}
    local mappings = {
      { '<F5>',      dap.continue,          desc = 'Debug: Start/Continue' },
      { '<F1>',      dap.step_into,         desc = 'Debug: Step Into' },
      { '<F2>',      dap.step_over,         desc = 'Debug: Step Over' },
      { '<F3>',      dap.step_out,          desc = 'Debug: Step Out' },
      { '<leader>b', dap.toggle_breakpoint, desc = 'Debug: Toggle Breakpoint' },
      {
        '<leader>B',
        function()
          dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = 'Debug: Set Breakpoint',
      },
    }

    if has_dapui then
      table.insert(mappings, { '<F7>', dapui.toggle, desc = 'Debug: See last session result.' })
    end

    return vim.list_extend(mappings, keys)
  end,
  config = function()
    local has_dap, dap = pcall(require, 'dap')
    if not has_dap then
      return
    end

    local has_dapui, dapui = pcall(require, 'dapui')

    local has_mason_dap, mason_dap = pcall(require, 'mason-nvim-dap')
    if has_mason_dap then
      mason_dap.setup {
        automatic_installation = true,
        handlers = {},
        ensure_installed = {},
      }
    end

    if has_dapui then
      dapui.setup {
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
          },
        },
      }

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end
  end,
}
