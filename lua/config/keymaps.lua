-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Snacks = require("snacks")

-- System and Badic Configurations
vim.keymap.set("n", "<leader>zh", function()
  Snacks.dashboard()
end, { desc = "Home Dashboard" })
vim.keymap.set("n", "<leader>zR", "<cmd>restart<cr>", { desc = "Restart" })

vim.keymap.set("i", "jk", "<Esc>", { desc = "Return Normal Mode" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Return Normal Mode" })
vim.keymap.set("i", ";;", "<C-o>", { desc = "Normal mode single operation" })

-- Exit terminal mode (for opencode.nvim and other terminal apps)
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "jj", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>fs", '<cmd>silent !start explorer /select,"%:p"<cr>', { desc = "Show in Explorer" })
vim.keymap.set("n", "<leader>fo", function()
  vim.ui.open(vim.fn.expand("%:p"))
end, { desc = "Open file in system" })

-- Markdown, Quarto, Zotero
vim.keymap.set("n", "<leader>ic", "<cmd>Telescope bibtex<CR>", { desc = "Bibtex citation" })
vim.keymap.set("i", "<C-S-i>", "<Plug>ZCite", { desc = "Insert citation" })
vim.keymap.set("n", "<leader>zp", "<cmd>QuartoPreview<cr>", { silent = true, noremap = true, desc = "Quarto preview" })
vim.keymap.set("n", "<leader>zr", function()
  vim.cmd("w") -- Save file before rendering
  Snacks.terminal("quarto render " .. vim.fn.expand("%"), {
    win = {
      position = "float",
      border = "rounded",
      height = 0.8,
      width = 0.8,
    },
    interactive = true,
  })
end, { desc = "Quarto Render (Terminal)" })

vim.keymap.set("i", "<C-S-b>", function()
  require("telescope").extensions.bibtex.bibtex()
end, { desc = "insert bibtex" })

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

-- Toggle Completion
vim.g.ghost_text_enabled = false
Snacks.toggle
  .new({
    name = "Ghost Text",
    get = function()
      return vim.g.ghost_text_enabled ~= false
    end,
    set = function(state)
      vim.g.ghost_text_enabled = state
      if not state then
        -- Hide menu immediately if disabling
        pcall(function()
          require("blink.cmp").hide()
        end)
      end
    end,
  })
  :map("<leader>zb") -- Map to 'UI Blink'

-- Quarto config
local runner = require("quarto.runner")
vim.keymap.set("n", "<leader>rc", runner.run_cell, { desc = "run cell", silent = true })
vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "run cell and above", silent = true })
vim.keymap.set("n", "<leader>rA", runner.run_all, { desc = "run all cells", silent = true })
vim.keymap.set("n", "<leader>rl", runner.run_line, { desc = "run line", silent = true })
vim.keymap.set("v", "<leader>r", runner.run_range, { desc = "run visual range", silent = true })
vim.keymap.set("n", "<leader>r%", function()
  runner.run_all(true)
end, { desc = "run all cells of all languages", silent = true })

-- Toggle Night/Day Theme (Catppuccin)
vim.keymap.set("n", "<leader>zT", function()
  if vim.o.background == "light" then
    vim.o.background = "dark"
  else
    vim.o.background = "light"
  end
end, { desc = "Toggle Dark/Light Mode" })

vim.keymap.set("n", "<leader>uz", function()
  Snacks.zen()
end, { desc = "Toggle Zen Mode" })

vim.keymap.set("n", "<leader>zP", function()
  require("utils.push_today").push_current_file()
end, { desc = "Push Current File" })
