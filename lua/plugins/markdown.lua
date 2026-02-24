return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-mini/mini.icons", -- Add this to ensure it's loaded first
    },
    ft = { "markdown", "quarto", "Avante" }, -- Load for both markdown and quarto filetypes
    opts = {
      file_types = { "markdown", "Avante", "quarto" }, -- Ensure quarto is included
      checkbox = {
        enabled = true,
      },
      latex = {
        enabled = false,
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown", "Avante", "quarto" }, -- Add 'quarto' to the filetypes
    config = function()
      vim.fn["mkdp#util#install"]()
      -- Optional: set a global variable to ensure the filetypes are registered internally
      vim.g.mkdp_filetypes = { "markdown", "Avante", "quarto" }
    end,
    build = ":call mkdp#util#install()",
  },
}
