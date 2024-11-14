return {
  {
    'github/copilot.vim',
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",                                                                    -- Optional: For using slash commands and variables in the chat buffer
      "nvim-telescope/telescope.nvim",                                                       -- Optional: For using slash commands
      { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } }, -- Optional: For prettier markdown rendering
      { "stevearc/dressing.nvim",                    opts = {} },                            -- Optional: Improves `vim.ui.select`
    },
    config = function()
      require('codecompanion').setup({
        opts = {
          language = "German" -- Default is "English"
        },
        display = {
          diff = {
            provider = "mini_diff",
          },
        },
        strategies = {
          chat = {
            adapter = "copilot",
            model = "o1-preview",
          },
          inline = {
            adapter = "copilot",
            model = "o1-preview",
          },
          agent = {
            adapter = "copilot",
            model = "o1-preview",
          },
        },
      })
    end,
  }
}
