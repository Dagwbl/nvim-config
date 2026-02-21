return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    styles = {
      notification = {
        wo = {
          wrap = true,
        },
      },
      zen = {
        backdrop = { transparent = false, blend = 90 },
      },
    },
    zen = {
      toggles = {
        diagnostics = false,
        inlay_hints = true,
      },
      on_open = function(win)
        win._number = vim.wo.number
        win._relativenumber = vim.wo.relativenumber
        win._completion = vim.b.completion_enabled

        vim.wo.number = false
        vim.wo.relativenumber = false
        vim.b.completion_enabled = false
        pcall(function()
          vim.opt.linespace = 8
        end)
        pcall(function()
          vim.opt.foldcolumn = "2"
        end)
      end,
      on_close = function(win)
        if win._completion ~= nil then
          vim.b.completion_enabled = win._completion
        end
        if win._number ~= nil then
          vim.wo.number = win._number
        end
        if win._relativenumber ~= nil then
          vim.wo.relativenumber = win._relativenumber
        end
        pcall(function()
          vim.opt.linespace = 2
        end)
        pcall(function()
          vim.opt.foldcolumn = "0"
        end)
      end,
    },
    image = {
      enabled = true,
      force = true,
      doc = {
        inline = false, -- Enable inline images in markdown/other buffers
        float = true,
      },
      markdown = {
        enabled = true,
        filetypes = { "markdown", "mdx", "quarto", "rmd", "qmd" },
      },
    },
    explorer = {
      enabled = true,
      show_hidden = true,
      show_git_ignored = true,
      layout = {
        preset = "sidebar",
        preview = "main",
      },
      auto_preview = true,
      replace_netrw = true,
    },
    notifier = {
      timeout = 5000,
    },
    picker = {
      sources = {
        explorer = {
          -- configure the explorer to avoid trying to render inline preview.
          layout = {
            preset = "sidebar",
            preview = "main",
          },
          auto_preview = true,
        },
      },
    },
  },
}
