-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.filetype.add({
  extension = {
    astro = "astro",
    rasi = "rasi",
    svelte = "svelte",
    qmd = "quarto",
  },
})

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("quarto_highlights"),
  pattern = { "quarto" },
  callback = function()
    vim.api.nvim_set_hl(0, "QuartoRef", { fg = "#995AEF", bold = true })
    vim.cmd([[syntax match QuartoRef /@\(fig\|tbl\|sec\|eq\)-[[:alnum:]_-]\+/]])
  end,
})

vim.api.nvim_create_user_command("GitPush", function()
  require("utils.push_today").push_current_file()
end, { desc = "Push current file" })

-- Cursor behavior
-- 正常的带闪烁光标设置（普通模式保持实心方块，插入模式竖线且闪烁，替换模式恢复默认横线 hor20）
local active_cursor = "n-v-c-sm:block,i-ci-ve:ver25-blinkwait500-blinkoff1000-blinkon1000,r-cr-o:hor20"

vim.opt.guicursor = active_cursor

local cursor_group = vim.api.nvim_create_augroup("NeovideFocusCursor", { clear = true })

vim.api.nvim_create_autocmd("FocusLost", {
  group = cursor_group,
  callback = function()
    -- 必须强制所有模式变成 block 并关闭闪烁。
    -- Neovide 识别到不闪烁的 block 时，会自动将其降级渲染为空心方框。
    vim.opt.guicursor = "a:block-blinkon0"
  end,
})

vim.api.nvim_create_autocmd("FocusGained", {
  group = cursor_group,
  callback = function()
    -- 重新获得焦点时恢复带闪烁的自定义设置
    vim.opt.guicursor = active_cursor
  end,
})
