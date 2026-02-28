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
          -- base = "#FAF4ED", -- 主编辑区背景：晨光纸白（更暖、更护眼）
          -- mantle = "#F2E9E1", -- 侧边栏/文件树背景：稍微深一点点，做层级区分
          -- crust = "#E8DFD6", -- 边缘 UI 元素：最深的一层纸张色
          base = "#F4F0EB", -- 【极简暖灰】：主编辑区背景 (Notion/Obsidian 风格)
          mantle = "#f3efea", -- 侧边栏/分屏背景：去掉红调的浅灰，保持层次
          crust = "#f2efef", -- 边缘 UI 元素：最深的一层灰
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
