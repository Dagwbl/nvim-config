return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      log_level = "DEBUG",
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").ollama({
            env = {
              url = vim.g.my_paths.ollama_api,
            },
            schema = {
              model = {
                default = "llama3.1:8b",
              },
            },
          })
        end,
      },
      interactions = {
        chat = {
          -- adapter = "ollama",
          adapter = "copilot",
        },
        cmd = {
          adapter = {
            name = "opencode",
            model = "minimax-m2.5-free",
          },
        },
        inline = {
          adapter = "copilot",
        },
      },
    },
    config = function(_, opts)
      require("codecompanion").setup(opts)
    end,
    keys = {
      { "<leader>ac", "<cmd>CodeCompanionChat<cr>", mode = { "n", "v" }, desc = "CodeCompanion: Chat" },
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion: Actions" },

      {
        "<leader>ax",
        function()
          require("codecompanion").cli("", { prompt = true })
        end,
        mode = "n",
        desc = "CodeCompanion: CLI Mode",
      },
      { "<leader>ak", "<cmd>CodeCompanion cmd<cr>", mode = "n", desc = "CodeCompanion: Cmd Mode" },
      {
        "<leader>at",
        function()
          require("codecompanion").toggle_chat()
        end,
        mode = "n",
        desc = "CodeCompanion: Toggle Chat",
      },

      { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "CodeCompanion: Add to Chat" },
    },
  },
}
