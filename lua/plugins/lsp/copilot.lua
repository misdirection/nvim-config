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
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              show_result_in_chat = true, -- Show the mcp tool result in the chat buffer
              make_vars = true,           -- make chat #variables from MCP server resources
              make_slash_commands = true, -- make /slash_commands from MCP server prompts
            },
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
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              env = {
                -- Für lokalen Betrieb genügt der Standard:
                url = "http://127.0.0.1:11434",
              },
              schema = {
                model = {
                  default = "qwen3:14b", -- Name des lokal via Ollama laufenden Modells
                },
              },
            })
          end,
        },
        prompt_library = {
          ["Software Engineering Expert"] = {
            strategy    = "chat", -- uses chat mode
            description = "Respond as a seasoned software engineer and design/architecture patterns authority",
            opts        = {
              mapping                = "<LocalLeader>se", -- optional keymap
              short_name             = "se",              -- slash-command: /se
              auto_submit            = false,             -- let you edit before sending
              stop_context_insertion = true,              -- avoid duplicate context inserts
            },
            prompts     = {
              {
                role    = "system",
                content = [[
You are a highly skilled senior software engineer with over 15 years of experience in both backend and frontend architectures, Clean Code principles, Test-Driven Development, and DevOps practices. You are also an authority on software design and architecture patterns (e.g., Singleton, Factory, Observer, Strategy, MVC, Hexagonal, Microservices, Event-Driven, CQRS, etc.). When relevant, you will apply and explain these patterns clearly and provide well-commented code examples that demonstrate their usage and benefits.Profile the code for hot paths, high-complexity loops, and memory issues. Recommend optimizations (data structures, caching) with code examples.]]
              },
              {
                role    = "user",
                content = [[
<user_prompt>Please describe your specific software engineering question or task:
– What problem are you trying to solve?
– Which tech stack are you using?
– Are there any special requirements or constraints?</user_prompt>]]
              },
            },
          },
          ["Current Buffer Review"] = {
            strategy    = "chat",
            description = "Review the entire current buffer, point out issues, and suggest improvements",
            opts        = {
              mapping                = "<LocalLeader>cr", -- keymap for buffer review
              modes                  = { "n" },           -- only in normal mode
              short_name             = "cr",              -- slash-command: /cr
              auto_submit            = true,              -- submit automatically
              stop_context_insertion = true,              -- avoid duplicate context inserts
              user_prompt            = false,             -- no additional user prompt needed
            },
            prompts     = {
              {
                role    = "system",
                content = function(context)
                  return "You are a senior software architect and expert code reviewer. Review the current "
                      .. context.filetype
                      .. " buffer thoroughly, identify any potential bugs or anti-patterns, and suggest improvements and best practices."
                end,
              },
              {
                role    = "user",
                content = function(context)
                  -- fetch all lines from the buffer
                  local lines = vim.api.nvim_buf_get_lines(context.bufnr, 0, -1, false)
                  local text = table.concat(lines, "\n")
                  return "Here is the full content of the buffer:\n\n```"
                      .. context.filetype
                      .. "\n"
                      .. text
                      .. "\n```"
                end,
                opts    = { contains_code = true },
              },
            },
          },
        }
      })
    end,
    keys = {
      { "<leader>cc", "<cmd>CodeCompanionChat<cr>",    desc = "CodeCompanion Chat",    noremap = true, silent = true },
      { "<leader>cx", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions", noremap = true, silent = true },
    },
  }
}
