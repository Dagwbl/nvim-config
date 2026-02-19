-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- System and Badic Configurations
vim.keymap.set("n", "<leader>zh", function()
  Snacks.dashboard()
end, { desc = "Home Dashboard" })

vim.keymap.set("i", "jk", "<Esc>", { desc = "Return Normal Mode" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Return Normal Mode" })
vim.keymap.set("i", ";;", "<C-o>", { desc = "Normal mode single operation" })

vim.keymap.set("n", "<leader>zs", '<cmd>silent !start explorer /select,"%:p"<cr>', { desc = "Show in Explorer" })
vim.keymap.set("n", "<leader>zo", function()
  vim.ui.open(vim.fn.expand("%:p"))
end, { desc = "Open file in system" })

-- Markdown, Quarto, Zotero
vim.keymap.set("n", "<leader>zc", "<cmd>Telescope zotero<cr>", { desc = "Zotero citation" })
vim.keymap.set("n", "<leader>zp", "<cmd>QuartoPreview<cr>", { silent = true, noremap = true, desc = "Quarto preview" })

-- Delete buffers
vim.keymap.set("n", "<leader><delete>", function()
  Snacks.bufdelete()
end, { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>bo", Snacks.bufdelete.other, { desc = "Close Other Buffers" })
vim.keymap.set("n", "<leader><CR>", "<cmd>%bd<cr>", { desc = "Close All Buffers" })

-- Change current word to hashtag
vim.keymap.set("n", "<leader>h", function()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()
  local start_col = vim.fn.match(line:sub(1, col + 1), "\\k*$")
  vim.api.nvim_buf_set_text(0, row - 1, start_col, row - 1, start_col, { "#" })
end, { desc = "Add hashtag before current word" })
