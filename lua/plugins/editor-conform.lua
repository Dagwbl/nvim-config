return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        prettier = {
          options = {
            ext_parsers = { quarto = "markdown" },
          },
        },
      },
      formatters_by_ft = {
        markdown = { "prettier" },
        quarto = { "prettier", "injected" },
        yaml = { "prettier" },
        json = { "prettier" },
      },
      lsp_as_diagnostics = {
        markdown = { "vale" },
        quarto = { "vale" },
      },
    },
  },
}
