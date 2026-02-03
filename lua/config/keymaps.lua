-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>zh", function()
  Snacks.dashboard()
end, { desc = "Home Dashboard" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Return Normal Mode" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Return Normal Mode" })
-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>zc", "<cmd>Telescope zotero<cr>", { desc = "Zotero citation" })
vim.keymap.set("n", "<leader>zp", "<cmd>QuartoPreview<cr>", { silent = true, noremap = true, desc = "Quarto preview" })

vim.keymap.set("n", "<leader>zs", '<cmd>silent !start explorer /select,"%:p"<cr>', { desc = "Show in Explorer" })

vim.keymap.set("n", "<leader>zo", function()
  vim.ui.open(vim.fn.expand("%:p"))
end, { desc = "Open file in system" })
