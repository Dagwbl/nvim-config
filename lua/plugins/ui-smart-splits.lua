return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  init = function()
    if vim.g.is_wezterm or vim.env.WEZTERM_PANE ~= nil or vim.env.TERM_PROGRAM == "WezTerm" then
      vim.g.smart_splits_multiplexer_integration = "wezterm"
    end
  end,
  keys = {
    {
      "<C-h>",
      function()
        require("smart-splits").move_cursor_left()
      end,
      mode = { "n", "t" },
      desc = "Move to left window",
    },
    {
      "<C-l>",
      function()
        require("smart-splits").move_cursor_right()
      end,
      mode = { "n", "t" },
      desc = "Move to right window",
    },
    {
      "<C-j>",
      function()
        require("smart-splits").move_cursor_down()
      end,
      mode = { "n", "t" },
      desc = "Move to below window",
    },
    {
      "<C-k>",
      function()
        require("smart-splits").move_cursor_up()
      end,
      mode = { "n", "t" },
      desc = "Move to above window",
    },
  },
}
