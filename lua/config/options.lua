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
  }
elseif hostname == "WVLIU-GD15" then
  -- vim.env.JAVA_HOME = "C:/Program Files/Eclipse Adoptium/jdk-25.0.2.10-hotspot"
  my_paths = {
    project_root = "~/personal/code",
    term_path = "cd D:/jinpeng6/Documents/Course/Winter-2026/",
    zotero_bib = "D:/jinpeng6/Documents/Course/Winter-2026/references.bib",
    zotero_sqlite = "C:/Users/jinpeng6/Zotero/zotero.sqlite",
    zotero_storage = "C:/Users/jinpeng6/Zotero/storage/",
  }
else
end

vim.g.my_paths = my_paths
vim.g.writing_ft = { markdown = true, quarto = true }

vim.opt.mouse = "a"
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.spelllang = { "en", "cjk" }
vim.opt.guicursor:append("i-ci-ve:ver25-blinkwait500-blinkoff1000-blinkon1000")
if vim.g.neovide then
  vim.cmd(vim.g.my_paths.term_path)
  vim.o.guifont = "Iosevka Nerd Font,IosevkaTermSlab Nerd Font Mono,JetBrainsMono Nerd Font Mono:h12"
  vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_cursor_smooth_blink = true
else
  vim.o.guifont =
    "Iosevka Nerd Font,IosevkaTermSlab Nerd Font Mono,Inter,JetBrainsMono Nerd Font Mono,Symbols Nerd Font Mono:h12"
end
