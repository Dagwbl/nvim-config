return {
  {
    "hedyhli/outline.nvim",
    dependencies = {
      "epheien/outline-treesitter-provider.nvim",
    },
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      providers = {
        priority = { "lsp", "norg", "markdown", "treesitter", "man" },
        markdown = { "markdown", "quarto" },
      },
      outline_window = {
        position = "left",
      },
      auto_jump = true,
    },
  },
}
