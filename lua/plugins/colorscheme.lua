return {
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-latte",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.theme = "catppuccin"
      opts.options.section_separators = { left = "", right = "" }
      -- opts.options.component_separators = { left = "", right = "" }
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
