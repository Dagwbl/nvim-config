return {
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "rcarriga/nvim-notify" },
    opts = {
      notification = true,
      callback = function(text)
        require("notify")(text, "info", {
          title = "Hardtime",
          timeout = 2000,
        })
      end,
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      max_width = 80,
      max_height = 10,
      render = "default",
      stages = "fade_in_slide_out",
      top_down = true,
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
}
