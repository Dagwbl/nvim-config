-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.opt.mouse = "a"
vim.opt.spelllang = "en_us"
local hostname = vim.fn.hostname()
if vim.g.neovide then
  -- Condition based on PC Name
  if hostname == "WVLIU-GD15" then
    vim.cmd("cd D:/jinpeng6/Documents/Course/Winter-2026/")
  elseif hostname == "R7000" then
    vim.cmd("cd D:/UA/Winter-2026/")
  end
  vim.o.guifont = "IosevkaTerm Nerd Font Mono,IosevkaTermSlab Nerd Font Mono,JetBrainsMono Nerd Font Mono:h13"
else
  vim.o.guifont =
    "IosevkaTerm Nerd Font Mono,IosevkaTermSlab Nerd Font Mono,Inter,JetBrainsMono Nerd Font Mono,Symbols Nerd Font Mono:h13"
end
