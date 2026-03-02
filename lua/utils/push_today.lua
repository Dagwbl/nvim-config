local M = {}

function M.push_current_file()
  -- 1. Save the current file
  vim.cmd("write")

  -- 2. Get the current file path
  local file = vim.fn.expand("%")
  if file == "" then
    vim.notify("No file to commit!", vim.log.levels.WARN)
    return
  end

  -- 3. Prompt for a commit message
  local default_msg = "Update " .. vim.fn.expand("%:t")
  local msg = vim.fn.input("Commit message (Enter to use default): ")
  if msg == "" then
    msg = default_msg
  end

  -- Clear the command line prompt
  vim.cmd("normal! :")

  -- 4. Notify user
  vim.notify("Pushing " .. file .. "...", vim.log.levels.INFO)

  -- 5. Construct and execute the Git command
  local cmd = string.format('git add %s && git commit -m "%s" && git push', vim.fn.shellescape(file), msg)

  local output = vim.fn.system(cmd)

  -- 6. Check for success/failure
  if vim.v.shell_error == 0 then
    vim.notify("Successfully pushed!\n" .. output, vim.log.levels.INFO)
  else
    vim.notify("Git error:\n" .. output, vim.log.levels.ERROR)
  end
end

return M
