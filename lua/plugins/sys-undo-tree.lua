return {
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
