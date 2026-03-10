return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    -- add options here
    default = {
      dir_path = "./assets",
      use_absolute_path = false,
      relative_to_current_file = true,
      drag_and_drop = {
        enabled = true,
        insert_mode = true,
      },
    },
    -- or leave it empty to use the default settings
  },
  keys = {
    -- suggested keymap
    { "<leader>zi", "<cmd>PasteImage<cr>", desc = "Paste image" },
  },
}
