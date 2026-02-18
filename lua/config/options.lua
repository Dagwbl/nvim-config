-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.opt.wrap = true
vim.opt.conceallevel = 0
vim.opt.mouse = "a"
vim.opt.linespace = 4
vim.opt.spell = true
vim.opt.spelllang = "en"
vim.o.guifont = "Inter:h12"

local hostname = vim.fn.hostname()
if vim.g.neovide then
  -- Condition based on PC Name
  if hostname == "WVLIU-GD15" then
    vim.cmd("cd D:/jinpeng6/Documents/Course/Winter-2026/")
  elseif hostname == "R7000" then
    vim.cmd("cd D:/UA/Winter-2026/")
  end

  -- vim.o.guifont = "JetBrainsMono Nerd Font Mono:h12"
end
