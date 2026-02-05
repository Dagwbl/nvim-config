return {
  {
    "saghen/blink.cmp",
    opts = {
      -- Use the "super-tab" preset for VS Code-like behavior
      keymap = { preset = "super-tab" },

      completion = {
        list = {
          selection = {
            preselect = true,
            auto_insert = true,
          },
        },
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
      },

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
