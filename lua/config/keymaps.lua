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

-- Exit terminal mode without conflicting with terminal apps like Lazygit
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>fs", function()
  local file = vim.fn.expand("%:p")
  if vim.fn.has("win32") == 1 then
    vim.fn.jobstart({ "explorer.exe", "/select," .. file }, { detach = true })
  else
    Snacks.terminal("yazi " .. vim.fn.shellescape(file))
  end
end, { desc = "Show current file in file manager" })
vim.keymap.set("n", "<leader>fo", function()
  vim.ui.open(vim.fn.expand("%:p"))
end, { desc = "Open file in system" })

-- Markdown, Quarto, Zotero
vim.keymap.set("n", "<leader>ic", "<cmd>Telescope bibtex<CR>", { desc = "Bibtex citation" })
vim.keymap.set("i", "<C-S-i>", "<Plug>ZCite", { desc = "Insert citation" })
vim.keymap.set("n", "<leader>zp", "<cmd>QuartoPreview<cr>", { silent = true, noremap = true, desc = "Quarto preview" })

local spell_dict_path = vim.fs.joinpath(vim.fn.stdpath("config"), "spell", "en.utf-8.add")

local function read_spell_words()
  if vim.fn.filereadable(spell_dict_path) == 0 then
    return {}
  end

  local words = {}
  local seen = {}
  for _, line in ipairs(vim.fn.readfile(spell_dict_path)) do
    local word = vim.trim(line):gsub("/.*$", "")
    if word ~= "" and not word:match("^#") and not seen[word] then
      seen[word] = true
      table.insert(words, word)
    end
  end

  return words
end

local function writing_lsp_config(server_name)
  local configs = {
    harper_ls = {
      filetypes = {
        "gitcommit",
        "markdown",
        "rst",
        "quarto",
        "typst",
      },
      settings = {
        ["harper-ls"] = {
          userDictPath = spell_dict_path,
        },
      },
    },
    ltex_plus = {
      filetypes = {
        "bib",
        "gitcommit",
        "markdown",
        "org",
        "plaintex",
        "rst",
        "rnoweb",
        "tex",
        "pandoc",
        "quarto",
      },
      settings = {
        ltex = {
          language = "en-US",
          checkFrequency = "manual",
          dictionary = {
            ["en-US"] = read_spell_words(),
          },
          disabledRules = {
            ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
          },
        },
      },
    },
  }

  return configs[server_name] or {}
end

local function start_writing_lsp(server_name, display_name)
  local ok, lspconfig = pcall(require, "lspconfig")
  local server = ok and lspconfig[server_name]
  if server then
    if server.setup then
      server.setup(vim.tbl_deep_extend("force", { autostart = false }, writing_lsp_config(server_name)))
    end

    if server.launch then
      server.launch()
      return
    end

    if server.manager then
      server.manager.try_add_wrapper(0)
      return
    end
  end

  vim.notify("Unable to start " .. display_name .. ". Make sure it is installed in Mason.", vim.log.levels.ERROR)
end

local function toggle_writing_lsp(server_name, display_name)
  local clients = vim.lsp.get_clients({ bufnr = 0, name = server_name })
  if #clients > 0 then
    for _, client in ipairs(clients) do
      vim.lsp.buf_detach_client(0, client.id)
      if vim.tbl_isempty(client.attached_buffers) then
        client.stop()
      end
    end
    vim.notify(display_name .. " stopped for this buffer", vim.log.levels.INFO)
    return
  end

  start_writing_lsp(server_name, display_name)
end

local function writing_lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    vim.notify("No LSP clients attached to this buffer", vim.log.levels.INFO)
    return
  end

  local names = vim.tbl_map(function(client)
    return client.name
  end, clients)
  vim.notify("Attached LSP clients: " .. table.concat(names, ", "), vim.log.levels.INFO)
end

local function writing_dict_status()
  vim.notify(
    ("Writing dictionary: %s (%d words)"):format(spell_dict_path, #read_spell_words()),
    vim.log.levels.INFO
  )
end

pcall(vim.api.nvim_del_user_command, "HarperToggle")
vim.api.nvim_create_user_command("HarperToggle", function()
  toggle_writing_lsp("harper_ls", "Harper")
end, { desc = "Toggle Harper for current buffer" })
pcall(vim.api.nvim_del_user_command, "LtexToggle")
vim.api.nvim_create_user_command("LtexToggle", function()
  toggle_writing_lsp("ltex_plus", "LTEX Plus")
end, { desc = "Toggle LTEX Plus for current buffer" })
pcall(vim.api.nvim_del_user_command, "WritingLspStatus")
vim.api.nvim_create_user_command("WritingLspStatus", writing_lsp_status, { desc = "Show LSP clients for current buffer" })
pcall(vim.api.nvim_del_user_command, "WritingDictStatus")
vim.api.nvim_create_user_command("WritingDictStatus", writing_dict_status, { desc = "Show writing dictionary status" })

vim.keymap.set("n", "<leader>zH", "<cmd>HarperToggle<cr>", { desc = "Toggle Harper" })
vim.keymap.set("n", "<leader>zL", "<cmd>LtexToggle<cr>", { desc = "Toggle LTEX Plus" })
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
