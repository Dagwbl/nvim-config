return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Note" },
    { "<leader>ot", "<cmd>ObsidianToday<cr>", desc = "Today's Diary" },
    { "<leader>oy", "<cmd>ObsidianYesterday<cr>", desc = "Yesterday's Diary" },
    { "<leader>om", "<cmd>ObsidianTomorrow<cr>", desc = "Tomorrow's Diary" },
    { "<leader>od", "<cmd>ObsidianDailies<cr>", desc = "Daily Notes List" },
    { "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch" },
    { "<leader>of", "<cmd>ObsidianSearch<cr>", desc = "Search Notes" },
    { "<leader>oT", "<cmd>ObsidianTemplate<cr>", desc = "Insert Template" },
    { "<leader>oN", "<cmd>ObsidianNewFromTemplate<cr>", desc = "New from Template" },
    { "<leader>op", "<cmd>ObsidianPasteImg<cr>", desc = "Paste Image" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Backlinks" },
    { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Open in Obsidian App" },
  },
  cmd = {
    "ObsidianNew",
    "ObsidianToday",
    "ObsidianYesterday",
    "ObsidianTomorrow",
    "ObsidianDailies",
    "ObsidianQuickSwitch",
    "ObsidianSearch",
    "ObsidianTemplate",
    "ObsidianNewFromTemplate",
    "ObsidianOpen",
    "ObsidianBacklinks",
    "ObsidianPasteImg",
  },
  opts = {
    -- 工作区配置
    workspaces = {
      {
        name = "blog",
        path = "D:/blog",
      },
    },

    -- 新笔记存放位置
    notes_subdir = "content/posts/note",

    -- 日记配置 - 匹配你的 content/diary/2026/January 结构
    daily_notes = {
      folder = "content/diary",
      date_format = "%Y/%B/%Y-%m-%d", -- 生成 2026/January/2026-01-23.md
      template = "diary.md",
    },

    -- 补全配置 - LazyVim 默认使用 blink.cmp
    completion = {
      nvim_cmp = false, -- 禁用 nvim-cmp
      blink = true, -- 启用 blink.cmp 集成
      min_chars = 2,
    },

    -- 模板配置
    templates = {
      folder = "archetypes/obsidian",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      substitutions = {
        yesterday = function()
          return os.date("%Y-%m-%d", os.time() - 86400)
        end,
        tomorrow = function()
          return os.date("%Y-%m-%d", os.time() + 86400)
        end,
        week = function()
          return os.date("%Y-W%W")
        end,
      },
    },
    -- 新笔记位置
    new_notes_location = "notes_subdir",

    -- 笔记 ID 生成 - 支持中文标题
    note_id_func = function(title)
      if title ~= nil then
        return title:gsub(" ", "-"):gsub("[^A-Za-z0-9%-\228-\233]", "")
      else
        return tostring(os.time())
      end
    end,

    -- Wiki 链接格式
    preferred_link_style = "markdown",

    -- ✅ 修复: 删除 use_advanced_uri（已弃用）

    -- Windows 打开外部链接
    follow_url_func = function(url)
      vim.ui.open(url) -- Neovim 0.10+ 原生支持
    end,

    follow_img_func = function(img)
      vim.ui.open(img)
    end,

    -- 排序
    sort_by = "modified",
    sort_reversed = true,

    -- 附件配置
    attachments = {
      img_folder = "static/images",
      img_name_func = function()
        return string.format("%s-", os.time())
      end,
    },
  },
}
