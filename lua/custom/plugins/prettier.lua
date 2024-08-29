return {
  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvimtools/none-ls-extras.nvim' },
    config = function()
      local null_ls = require 'null-ls'
      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.prettier,
          require 'none-ls.diagnostics.eslint_d',
        },
        -- on_attach = function(client, bufnr)
        --   if client.supports_method 'textDocument/formatting' then
        --     vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        --
        --     vim.api.nvim_create_autocmd('BufWritePre', {
        --       group = augroup,
        --       buffer = bufnr,
        --       callback = function()
        --         if client.supports_method 'textDocument/formatting' then
        --           vim.lsp.buf.format { async = true }
        --         end
        --         -- Linting
        --         if client.supports_method 'textDocument/publishDiagnostics' then
        --           vim.lsp.buf.lint()
        --         end
        --       end,
        --     })
        --   end
        -- end,
      }
    end,
  },
}
