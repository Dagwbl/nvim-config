return {
  {
    "saghen/blink.cmp",
    opts = {
      -- Use the "super-tab" preset for VS Code-like behavior
      keymap = { preset = "super-tab" },

      sources = {
        default = { "avante" },
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
          },
        },
      },
    },
  },
}
