local writing_editor_prompt = table.concat({
  "You are a careful English editor for a non-native English speaker.",
  "Preserve the author's meaning, voice, level of certainty, citations, Markdown, LaTeX, and technical terms.",
  "Do not add new claims, examples, references, or evidence.",
  "Do not make the writing sound inflated, overly formal, or AI-generated.",
  "Return only the revised text, with no explanation, labels, quotation marks, or Markdown fences.",
}, "\n")

local writing_teacher_prompt = table.concat({
  "You are a concise English meaning tutor for a non-native English speaker.",
  "Explain only the selected text.",
  "For a single word or short phrase, give its meaning, common usage, and a simple example.",
  "For a sentence or longer passage, explain the meaning in simpler English.",
  "Do not correct grammar, polish style, or rewrite the full text unless the author explicitly asks.",
}, "\n")

return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      log_level = "DEBUG",
      prompt_library = {
        ["Grammar"] = {
          strategy = "inline",
          description = "Fix grammar in the selection",
          opts = {
            alias = "writing_grammar",
            short_name = "writing_grammar",
            modes = { "x" },
            placement = "replace",
            auto_submit = true,
          },
          prompts = {
            {
              role = "system",
              content = writing_editor_prompt,
            },
            {
              role = "user",
              content = table.concat({
                "Correct only clear language problems in the selected text:",
                "- grammar, spelling, punctuation, articles, prepositions, tense, word order, and awkward phrasing",
                "- keep the same meaning, structure, tone, and level of formality when possible",
                "- preserve all citations, links, Markdown, LaTeX, code, numbers, names, and domain terms",
                "- if the text is already acceptable, return it unchanged",
              }, "\n"),
            },
          },
        },
        ["Polish"] = {
          strategy = "inline",
          description = "Polish the selection",
          opts = {
            alias = "writing_polish",
            short_name = "writing_polish",
            modes = { "x" },
            placement = "replace",
            auto_submit = true,
          },
          prompts = {
            {
              role = "system",
              content = writing_editor_prompt,
            },
            {
              role = "user",
              content = table.concat({
                "Polish the selected text into clear, natural academic English:",
                "- improve flow, concision, transitions, and word choice",
                "- keep the author's meaning, voice, and level of certainty",
                "- avoid making the prose sound generic, inflated, or over-polished",
                "- preserve all citations, links, Markdown, LaTeX, code, numbers, names, and domain terms",
                "- if a sentence is already strong, do not change it unnecessarily",
              }, "\n"),
            },
          },
        },
        ["Explain"] = {
          strategy = "chat",
          description = "Explain English issues",
          opts = {
            alias = "writing_explain",
            short_name = "writing_explain",
            modes = { "x" },
            auto_submit = true,
          },
          prompts = {
            {
              role = "system",
              content = writing_teacher_prompt,
            },
            {
              role = "user",
              content = table.concat({
                "Explain the selected text as an English meaning tutor.",
                "Do not correct grammar, polish style, or revise the text.",
                "Use this format:",
                "",
                "Meaning:",
                "- Explain what the selected text means in simpler English.",
                "",
                "Usage:",
                "- Explain when or how this word, phrase, or expression is commonly used.",
                "",
                "Example:",
                "- Give one short original example sentence if useful.",
                "",
                "Note:",
                "- Mention any nuance, formality, or common confusion.",
              }, "\n"),
            },
          },
        },
      },
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
            name = "copilot",
            model = "copilot",
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
        "<leader>ag",
        ":CodeCompanion /writing_grammar<cr>",
        mode = "x",
        desc = "Grammar",
      },
      {
        "<leader>ap",
        ":CodeCompanion /writing_polish<cr>",
        mode = "x",
        desc = "Polish",
      },
      {
        "<leader>ae",
        ":CodeCompanion /writing_explain<cr>",
        mode = "x",
        desc = "Explain English",
      },

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
