-- Set system locale to English UTF-8
-- vim.env.LANG = "en_US.UTF-8"
-- Set Neovim's language to English
-- vim.cmd("language en_US")
-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.neovide then
  vim.cmd("cd D:/jinpeng6/Documents/Course/Winter-2026/")
end
require("config.lazy")
