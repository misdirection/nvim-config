-- INFO: insert local settings here
local M = {}

M.lsp_servers = { -- INFO: used in plugins/lsp/nvim-lspconfig.lua
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
}
-- Extract the keys (LSP server names) from M.lsp_servers
local ensure_installed = vim.tbl_keys(M.lsp_servers)

-- Define additional tools to be installed
local additional_tools = {
  'stylua',
}

M.dap_python_config = function(_) --INFO: used in plugins/lsp/debug
end

-- Combine ensure_installed with additional_tools
M.mason_ensure_installed = vim.list_extend(ensure_installed, additional_tools)

M.treesitter_ensure_installed = { -- INFO: used in plugins/lsp/nvim-treesitter.lua
}

M.obsidian_workspaces = { -- INFO: used in plugins/obsidian.lua
  {
  },
}
return M
