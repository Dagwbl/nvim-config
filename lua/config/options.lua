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
    zotero_bib = "D:/UA/Winter-2026/references.bib",
    zotero_sqlite = "C:/Users/jeapo/Zotero/zotero.sqlite",
    ollama_api = "http://100.88.245.13:11434",
  }
elseif hostname == "WVLIU-GD15" then
  my_paths = {
    ollama_api = "http://localhost:11434",
    project_root = "~/personal/code",
    term_path = "cd D:/jinpeng6/Documents/Course/Winter-2026/",
    zotero_bib = "D:/jinpeng6/Documents/Course/Winter-2026/references.bib",
    zotero_sqlite = "C:/Users/jinpeng6/Zotero/zotero.sqlite",
    zotero_storage = "C:/Users/jinpeng6/Zotero/storage/",
    python = "C:/Users/jinpeng6/.conda/envs/main/python.exe",
    R_path = "C:/Users/jinpeng6/scoop/shims/R.exe",
  }
else
end

vim.g.my_paths = my_paths
vim.g.writing_ft = { markdown = true, quarto = true }
vim.g.python3_host_prog = my_paths.python
if my_paths.R_path then
  vim.g.R_path = my_paths.R_path
end
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.mouse = "a"
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.spelllang = { "en", "cjk" }
vim.opt.guicursor:append("i-ci-ve:ver25-blinkwait500-blinkoff1000-blinkon1000")
if vim.g.neovide then
  vim.cmd(vim.g.my_paths.term_path)
  vim.opt.guifont = "Iosevka Nerd Font,IosevkaTermSlab Nerd Font Mono,JetBrainsMono Nerd Font Mono:h12"
  vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_cursor_smooth_blink = true
else
  vim.opt.guifont =
    "Iosevka Nerd Font,IosevkaTermSlab Nerd Font Mono,Inter,JetBrainsMono Nerd Font Mono,Symbols Nerd Font Mono:h12"
end
