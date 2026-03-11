return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = opts.servers or {}
    opts.servers["ltex"] = {
      filetypes = { "markdown", "quarto", "tex", "bibtex" },
      settings = {
        ltex = {
          language = "en-US",
          checkFrequency = "save",
          disabledRules = {
            ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
          },
          additionalRules = {
            enablePickyRules = false,
          },
        },
      },
    }
  end,
}
