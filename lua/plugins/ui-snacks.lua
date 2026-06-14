return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    dashboard = {
      preset = {
        keys = {
          {
            icon = " ",
            key = "f",
            desc = "Find File",
            action = ":lua Snacks.dashboard.pick('files')",
          },
          { icon = "󰧮 ", key = "n", desc = "Daily Note", action = ":Obsidian today" },
          {
            icon = " ",
            key = "g",
            desc = "Find Text",
            action = ":lua Snacks.dashboard.pick('live_grep')",
          },
          {
            icon = " ",
            key = "r",
            desc = "Recent Files",
            action = ":lua Snacks.dashboard.pick('oldfiles')",
          },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        -- header = [[
        --   ▄▄▄  ▄▄         ▄▄    ▄▄
        --  █▀██  ██        ██   ▄█▀▀█▄
        --    ██  ██       ▄██▄  ██  ██
        --    ██  ██  ▄███▄ ██   ██▀▀██
        --    ██  ██  ██ ██ ██ ▄ ██  ██
        --    ▀█████▄▄▀███▀▄██ ▀██▀  ▀█▄█
        --                  ██
        --                 ▀▀
        -- ]],
        header = [[
          █    ██  ▒█████    █████▒▄▄▄             
          ██  ▓██▒▒██▒  ██▒▓██   ▒▒████▄           
         ▓██  ▒██░▒██░  ██▒▒████ ░▒██  ▀█▄         
         ▓▓█  ░██░▒██   ██░░▓█▒  ░░██▄▄▄▄██        
         ▒▒█████▓ ░ ████▓▒░░▒█░    ▓█   ▓██▒       
         ░▒▓▒ ▒ ▒ ░ ▒░▒░▒░  ▒ ░    ▒▒   ▓▒█░       
         ░░▒░ ░ ░   ░ ▒ ▒░  ░       ▒   ▒▒ ░       
          ░░░ ░ ░ ░ ░ ░ ▒   ░ ░     ░   ▒          
            ░         ░ ░               ░  ░       
        ]],
      },
    },
    styles = {
      notification = {
        wo = {
          wrap = true,
        },
      },
      zen = {
        backdrop = { transparent = false, blend = 90 },
        -- width = 95,
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
        -- win._completion = vim.g.blink_enabled
        win._wrap = vim.wo.wrap
        -- win._neovide_fullscreen = vim.g.neovide_fullscreen

        vim.wo.wrap = true
        vim.wo.number = false
        vim.wo.relativenumber = false
        -- vim.g.blink_enabled = false
        -- if vim.g.neovide then
        --   vim.g.neovide_fullscreen = true
        -- end
        -- pcall(function()
        --   require("blink.cmp").hide()
        -- end)

        pcall(function()
          vim.opt.linespace = 3
        end)
        pcall(function()
          vim.opt.foldcolumn = "2"
        end)
      end,
      on_close = function(win)
        -- if win._completion ~= nil then
        -- vim.g.blink_enabled = win._completion
        -- end
        if win._number ~= nil then
          vim.wo.number = win._number
        end
        if win._relativenumber ~= nil then
          vim.wo.relativenumber = win._relativenumber
        end
        if win._wrap ~= nil then
          vim.wo.wrap = win._wrap
        end
        -- if vim.g.neovide and win._neovide_fullscreen ~= nil then
        --   vim.g.neovide_fullscreen = win._neovide_fullscreen
        -- end
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
        filetypes = { "markdown", "mdx", "quarto", "rmd" },
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
      replace_netrw = false,
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
