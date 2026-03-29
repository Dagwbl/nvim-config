return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      update_in_insert = false,
    },
    servers = {
      -- Rename 'ltex' to 'ltex_plus'
      ltex_plus = {
        enabled = false,
        settings = {
          ltex = { -- Note: The inner settings key usually remains 'ltex'
            language = "en-US",
            checkFrequency = "manual", -- This will now be correctly applied
            disabledRules = {
              ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
            },
          },
        },
      },
      ltex = { enabled = false },
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      },
    },
  },
}
