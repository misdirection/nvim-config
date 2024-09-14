-- insert local settings here
local M = {}

M.lsp_servers = {
  -- elixirls = {},
  -- lua_ls = {
  --   settings = {
  --     Lua = {
  --       completion = {
  --         callSnippet = 'Replace',
  --       },
  --     },
  --   },
  -- },
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

M.treesitter_ensure_installed = {
  -- 'bash',
  -- 'c',
  -- 'diff',
  -- 'elixir',
  -- 'eex',
  -- 'html',
  'lua',
  'luadoc',
  -- 'markdown',
  -- 'markdown_inline',
  -- 'query',
  -- 'vim',
  -- 'vimdoc'
}

M.null_ls_sources = {
  -- null_ls.builtins.formatting.prettier,
}

return M
