local M = {}
M.active = false

function M.toggle()
  M.active = not M.active

  if M.active then
    -- UI cleanup
    vim.o.number = false
    vim.o.relativenumber = false
    vim.o.signcolumn = "no"
    -- vim.o.foldcolumn = "auto:2"
    -- vim.o.laststatus = 1
    -- vim.o.showmode = false

    -- Text behavior
    vim.o.wrap = true
    vim.o.linebreak = true
    vim.o.linespace = 8
    vim.o.breakindent = true
    vim.o.spell = true
    vim.o.spelllang = "en_us"
    vim.o.textwidth = 0

    -- Hide diagnostics
    vim.diagnostic.enable(false)
    vim.b.completion_enabled = false

    -- Markdown conceal
    vim.o.conceallevel = 2

    -- Open zen layout
    -- vim.cmd("ZenMode")
    -- require("twilight").enable()
  else
    -- Restore UI
    vim.o.number = true
    vim.o.relativenumber = true
    vim.o.signcolumn = "yes"
    -- vim.o.laststatus = 3
    -- vim.o.showmode = true
    vim.o.linespace = 4
    vim.o.foldcolumn = "auto:0"

    -- Restore text behavior
    vim.o.wrap = false
    vim.o.spell = false
    vim.o.conceallevel = 0

    vim.diagnostic.enable(true)
    vim.b.completion_enabled = true

    -- require("zen-mode").close()
    -- require("twilight").disable()
  end
end

return M
