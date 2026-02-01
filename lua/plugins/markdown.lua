return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "quarto" }, -- Load for both markdown and quarto filetypes
  opts = {
    file_types = { "markdown", "quarto" }, -- Ensure quarto is included
    latex = {
      enabled = false,
    },
  },
}
