return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = { "prettier" },
        quarto = { "prettier" },
        yaml = { "prettier" },
        json = { "prettier" },
      },
      lsp_as_diagnostics = {
        markdown = { "vale" },
        quarto = { "vale" },
      },
      format_on_save = true,
    },
  },
}
