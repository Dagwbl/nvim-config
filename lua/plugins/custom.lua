return {
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },
  {
    "jiaoshijie/undotree",
    opts = {
      -- your options
    },
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>zu", "<cmd>lua require('undotree').toggle()<cr>", desc = "Undo tree" },
    },
  },
}
