local M = {}
M.active = false

function M.toggle()
  M.active = not M.active

  if M.active then
    -- UI cleanup
    vim.o.number = false
    vim.o.relativenumber = false
    vim.o.signcolumn = "no"
    vim.o.cursorline = false
    vim.o.colorcolumn = ""
    vim.o.laststatus = 0
    vim.o.showmode = false

    -- Text behavior
    vim.o.wrap = true
    vim.o.linebreak = true
    vim.o.breakindent = true
    vim.o.spell = true
    vim.o.spelllang = "en_ca"
    vim.o.textwidth = 0

    -- Hide diagnostics
    vim.diagnostic.enable(false)

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
    vim.o.cursorline = true
    vim.o.laststatus = 3
    vim.o.showmode = true

    -- Restore text behavior
    vim.o.wrap = false
    vim.o.spell = false
    vim.o.conceallevel = 0

    vim.diagnostic.enable(true)

    -- require("zen-mode").close()
    -- require("twilight").disable()
  end
end

return M
