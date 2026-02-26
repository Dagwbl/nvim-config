return {
  {
    "antonk52/markdowny.nvim",
    config = function()
      require("markdowny").setup({
        filetypes = { "markdown", "gitcommit", "hgcommit", "quarto" },
      })
    end,
  },
}
