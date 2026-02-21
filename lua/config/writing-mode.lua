local M = {}
M.active = false

function M.enable()
  if M.active then
    return
  end
  M.active = true

  -- UI cleanup
  vim.o.number = false
  vim.o.relativenumber = false
  vim.o.signcolumn = "no"
  vim.o.laststatus = 0

  -- Text behavior
  vim.o.wrap = true
  vim.o.linebreak = true
  vim.o.breakindent = true
  vim.o.spell = true
  vim.o.spelllang = "en_us"
  vim.o.textwidth = 0
  pcall(function()
    vim.opt.linespace = 8
  end)
  pcall(function()
    vim.opt.foldcolumn = "2"
  end)

  -- Hide diagnostics
  vim.diagnostic.enable(false)
  vim.b.completion_enabled = false

  -- Markdown conceal
  vim.o.conceallevel = 2

  -- Open zen layout
  -- vim.cmd("ZenMode")
  -- require("twilight").enable()
end

function M.disable()
  if not M.active then
    return
  end
  M.active = false

  -- Restore UI
  vim.o.number = true
  vim.o.relativenumber = true
  vim.o.signcolumn = "yes"
  vim.o.laststatus = 3
  pcall(function()
    vim.opt.linespace = 2
  end)
  pcall(function()
    vim.opt.foldcolumn = "0"
  end)

  -- Restore text behavior
  vim.o.wrap = false
  vim.o.spell = false
  vim.o.conceallevel = 0

  vim.diagnostic.enable(true)
  vim.b.completion_enabled = true

  -- require("zen-mode").close()
  -- require("twilight").disable()
end

function M.toggle()
  if M.active then
    M.disable()
  else
    M.enable()
  end
end

return M
