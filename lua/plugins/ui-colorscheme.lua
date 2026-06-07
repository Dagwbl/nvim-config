return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      -- transparent_background = vim.g.is_wezterm,
      transparent_background = false,
      float = {
        transparent = false,
        blend = 10,
      },
      render_markdown = true,
      background = {
        light = "latte",
        dark = "mocha",
      },
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.10,
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.theme = "catppuccin-mocha"
      opts.options.section_separators = { left = "", right = "" }
      opts.options.component_separators = { left = "", right = "" }
    end,
  },
}
