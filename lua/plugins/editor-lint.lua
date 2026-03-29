-- ~/.config/nvim/lua/plugins/lint.lua
return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = { -- The linter LazyVim uses by default
          args = { "--disable", "MD013,MD025", "--" },
        },
      },
    },
  },
}
