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
        priority = { "lsp", "markdown", "treesitter" },
      },
    },
  },
}
