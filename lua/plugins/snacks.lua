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
    picker = {
      sources = {
        explorer = {
          -- configure the explorer to avoid trying to render inline preview.
        },
      },
    },
  },
}
