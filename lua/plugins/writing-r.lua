return {
  {
    "R-nvim/R.nvim",
    enabled = false,
    opts = function(_, opts)
      if vim.g.my_paths and vim.g.my_paths.R_path then
        opts.R_path = vim.g.my_paths.R_path
      end
    end,
  },
}
