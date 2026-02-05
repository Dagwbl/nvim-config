return {
  {
    "yetone/avante.nvim",
  keys = {
    {
      "<leader>ap",
      function()
        local avante = require("avante")
        local config = require("avante.config")
        -- Get all defined provider keys from your config
        local providers = vim.tbl_keys(config.providers)
        
        vim.ui.select(providers, {
          prompt = "Select Avante Provider:",
          format_item = function(item)
            return config.providers[item].display_name or item
          end,
        }, function(choice)
          if choice then
            vim.cmd("AvanteSwitchProvider " .. choice)
          end
        end)
      end,
      desc = "Avante: Select Provider",
    },
  },
    opts = {
      provider = "copilot",
      providers = {
        copilot = {
          model = "claude-sonnet-4.5",
          display_name = "Sonnet 4.5",
        },
        ["copilot-sonnet"] = {
          __inherited_from = "copilot",
          model = "claude-sonnet-4.5",
          display_name = "Sonnet 4.5",
        },
        ["copilot-gpt5"] = {
          __inherited_from = "copilot",
          model = "gpt-5.2-codex",
          display_name = "GPT-5.2",
        },
        ["copilot-opus"] = {
          __inherited_from = "copilot",
          model = "claude-opus-4.5",
          display_name = "Opus 4.5",
        },
        ["gemini"] = {
          endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
          model = "gemini-3.0-pro",
          display_name = "Gemini 3.0 Pro",
          api_key_name = "GEMINI_API_KEY",
        },
      },
    },
  },
}
