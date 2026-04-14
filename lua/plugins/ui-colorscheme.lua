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
      transparent_background = vim.g.is_wezterm,
      float = {
        transparent = false,
        blend = 10,
      },
      render_markdown = true,
      background = {
        light = "latte",
        dark = "macchiato",
      },
      color_overrides = {
        latte = {
          base = "#fdf6e3",
          mantle = "#eee8d5",
          crust = "#ddd6c1",
        },
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
      opts.options.theme = "catppuccin-latte"
      opts.options.section_separators = { left = "", right = "" }
      opts.options.component_separators = { left = "", right = "" }
    end,
  },
}
