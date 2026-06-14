return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.preset = "helix" -- "classic" is better for wide/multi-column layouts
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "<leader>a", group = "AI" },
        { "<leader>i", group = "Insert / citations" },
        { "<leader>o", group = "Outline / opencode" },
        { "<leader>r", group = "Run code" },
        { "<leader>z", group = "Personal tools" },
      })
    end,
  },
}
