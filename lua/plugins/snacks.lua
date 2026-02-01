return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    image = {
      enabled = true,
      force = true,
      doc = {
        inline = false, -- Enable inline images in markdown/other buffers
        float = true,
      },
    },
    explorer = {
      enabled = true,
      show_hidden = true,
      show_git_ignored = true,
      layout = {
        preset = "sidebar",
        preview = "main",
      },
      auto_preview = true,
      replace_netrw = true,
    },
    picker = {
      sources = {
        explorer = {
          -- configure the explorer to avoid trying to render inline preview.
          layout = {
            preset = "sidebar",
            preview = "main",
          },
          auto_preview = true,
        },
      },
    },
  },
}
