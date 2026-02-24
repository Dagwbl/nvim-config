-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- In lua/config/options.lua
local hostname = vim.uv.os_gethostname()
local my_paths = {}

if hostname == "R7000" then
  my_paths = {
    project_root = "~/projects/work",
    term_path = "cd D:/blog/",
    zotero_bib = "D:/UA/Winter-2026/Zotero.bib",
  }
elseif hostname == "WVLIU-GD15" then
  my_paths = {
    project_root = "~/personal/code",
    term_path = "cd D:/jinpeng6/Documents/Course/Winter-2026/",
    zotero_bib = "D:/jinpeng6/Documents/Course/Winter-2026/Zotero.bib",
  }
else
end

vim.g.my_paths = my_paths

vim.opt.mouse = "a"
vim.opt.wrap = true
vim.opt.spell = true

if vim.g.neovide then
  vim.cmd(vim.g.my_paths.term_path)
  vim.o.guifont = "Iosevka Nerd Font Mono,IosevkaTermSlab Nerd Font Mono,JetBrainsMono Nerd Font Mono:h14"
  vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
else
  vim.o.guifont =
    "Iosevka Nerd Font Mono,IosevkaTermSlab Nerd Font Mono,Inter,JetBrainsMono Nerd Font Mono,Symbols Nerd Font Mono:h14"
end
