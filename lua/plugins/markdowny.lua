return {
  {
    "antonk52/markdowny.nvim", --provide quickly bold, italic for markdown
    config = function()
      require("markdowny").setup({
        filetypes = { "markdown", "gitcommit", "hgcommit", "quarto" },
      })
    end,
  },
}
