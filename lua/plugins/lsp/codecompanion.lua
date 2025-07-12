function load_prompts()
  local prompts = {}
  local prompt_dir = vim.fn.stdpath("config") .. "/lua/prompts"

  for _, file in ipairs(vim.fn.readdir(prompt_dir)) do
    if file:match("%.lua$") then
      local prompt_name = file:gsub("%.lua$", "")                           -- Remove the .lua extension
      prompt_name = prompt_name:gsub("_", " ")                              -- Replace underscores with spaces
      prompt_name = prompt_name:gsub("(%l)(%w*)", function(first, rest)
        return first:upper() .. rest:lower()                                -- Capitalize each word
      end)
      prompts[prompt_name] = require("prompts." .. file:gsub("%.lua$", "")) -- Load the prompt file
    end
  end

  return prompts
end

return {
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
      local prompts = load_prompts() -- Dynamically load all prompts
      require('codecompanion').setup({
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              show_result_in_chat = true, -- Show mcp tool results in chat
              make_vars = true,           -- Convert resources to #variables
              make_slash_commands = true, -- Add prompts as /slash commands
            }
          }
        },
        opts = {
          -- language = "German" -- Default is "English"
        },
        display = {
          diff = {
            provider = "mini_diff",
          },
          chat = {
            render_headers = false,
          },
        },
        adapters = {
          copilot = function()
            return require("codecompanion.adapters").extend("copilot", {})
          end,
        },
        prompt_library = prompts,
      })
    end,
    keys = {
      { "<leader>cc", "<cmd>CodeCompanionChat<cr>",    desc = "CodeCompanion Chat",    noremap = true, silent = true },
      { "<leader>cx", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions", noremap = true, silent = true },
    },
  },
}
