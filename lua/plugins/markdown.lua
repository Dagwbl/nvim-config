return {
  "MeanderingProgrammer/render-markdown.nvim",
  -- ft = { "markdown", "quarto" }, -- Load for both markdown and quarto filetypes
  opts = {
    -- file_types = { "markdown", "quarto" }, -- Ensure quarto is included
    latex = {
      enabled = false,
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown", "quarto" }, -- Add 'quarto' to the filetypes
    config = function()
      vim.fn["mkdp#util#install"]()
      -- Optional: set a global variable to ensure the filetypes are registered internally
      vim.g.mkdp_filetypes = { "markdown", "quarto" }
    end,
    build = ":call mkdp#util#install()",
  },
}
