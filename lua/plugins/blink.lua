return {
  {
    "saghen/blink.cmp",
    opts = {
      -- Use the "super-tab" preset for VS Code-like behavior
      keymap = { preset = "super-tab" },

      completion = {
        list = {
          selection = {
            -- VS Code typically preselects the first item but doesn't auto-insert
            preselect = true,
            auto_insert = false,
          },
        },
        -- Documentation automatically shows in VS Code
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
      },
    },
  },
}
