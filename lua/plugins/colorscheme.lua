return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-latte",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      background = {
        light = "latte",
        dark = "macchiato",
      },
      color_overrides = {
        latte = {
          base = "#F4F0EB",
          mantle = "#e9e1d7",
          crust = "#dfd3c2",
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.theme = "catppuccin"
      opts.options.section_separators = { left = "", right = "" }
      -- opts.options.component_separators = { left = "", right = "" }
      opts.options.component_separators = { left = "", right = "" }
    end,
  },
  -- Gruvbox light/soft settings
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   config = function()
  --     vim.o.background = "light"
  --     vim.g.gruvbox_contrast_light = "soft"
  --   end,
  -- },
}
