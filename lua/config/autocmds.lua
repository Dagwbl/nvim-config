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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "quarto", "tex", "text" },
  callback = function()
    Snacks.zen()
  end,
})

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("quarto_highlights"),
  pattern = { "quarto" },
  callback = function()
    vim.api.nvim_set_hl(0, "QuartoRef", { fg = "#995AEF", bold = true })
    vim.fn.matchadd("QuartoRef", [=[@\(fig\|tbl\|sec\|eq\)-[[:alnum:]_]\+]=])
  end,
})
