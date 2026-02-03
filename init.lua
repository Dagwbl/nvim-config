-- Set system locale to English UTF-8
-- vim.env.LANG = "en_US.UTF-8"
-- Set Neovim's language to English
-- vim.cmd("language en_US")
-- bootstrap lazy.nvim, LazyVim and your plugins
local hostname = vim.fn.hostname()

if vim.g.neovide then
  -- Condition based on PC Name
  if hostname == "WVLIU-GD15" then
    vim.cmd("cd D:/jinpeng6/Documents/Course/Winter-2026/")
  elseif hostname == "R7000" then
    vim.cmd("cd D:/UA/Winter-2026/")
  end

  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h12"
end
require("config.lazy")
