return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      -- behaviour = { auto_suggestions = true },
      provider = "copilot",
      mode = "agentic",
      providers = {
        copilot = { model = "claude-haiku-4.5", auto_select_model = true },
      },
    },
  },
}
