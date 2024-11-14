-- INFO: insert local settings here
local M = {}

M.lsp_servers = { -- INFO: used in plugins/lsp/nvim-lspconfig.lua
  elixirls = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
  -- volar = {
  --   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  --   init_options = {
  --     vue = {
  --       hybridMode = false,
  --     },
  --   },
  --   on_attach = function(client, bufnr)
  --     client.server_capabilities.documentFormattingProvider = false
  --     client.server_capabilities.documentRangeFormattingProvider = false
  --   end,
  -- },
}
-- Extract the keys (LSP server names) from M.lsp_servers
local ensure_installed = vim.tbl_keys(M.lsp_servers)

-- Define additional tools to be installed
local additional_tools = {
  'stylua',
  'prettier',
}

M.dap_python_config = function()
end

-- Combine ensure_installed with additional_tools
M.mason_ensure_installed = vim.list_extend(ensure_installed, additional_tools)

M.treesitter_ensure_installed = { -- INFO: used in plugins/lsp/nvim-treesitter.lua
  -- 'bash',
  -- 'c',
  -- 'diff',
  -- 'elixir',
  -- 'eex',
  -- 'html',
  -- 'lua',
  -- 'luadoc',
  -- 'markdown',
  -- 'markdown_inline',
  -- 'query',
  -- 'vim',
  -- 'vimdoc'
}

M.obsidian_workspaces = { -- INFO: used in plugins/obsidian.lua
  {
    name = "personal",
    path = "~/src/vault/obsidian-vault",
  },
}
return M
