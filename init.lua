-- Set system locale to English UTF-8
-- vim.env.LANG = "en_US.UTF-8"
-- Set Neovim's language to English
-- vim.cmd("language en_US")
-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.neovide then
  vim.cmd("cd D:/jinpeng6/Documents/Course/Winter-2026/")
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h12" -- text below applies for VimScript
  --  vim.g.python3_host_prog = "C:/Users/jinpeng6/.conda/envs/main/python.exe"
end
require("config.lazy")
