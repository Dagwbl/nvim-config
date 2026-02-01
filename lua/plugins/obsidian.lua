return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ft = "markdown",

  -- lazy.nvim keybindings (updated to new format)
  keys = {
    { "<leader>zn", "<cmd>Obsidian new<cr>", desc = "New Note" },
    { "<leader>zt", "<cmd>Obsidian today<cr>", desc = "Today's Diary" },
    { "<leader>zy", "<cmd>Obsidian yesterday<cr>", desc = "Yesterday's Diary" },
    --     { "<leader>om", "<cmd>Obsidian tomorrow<cr>", desc = "Tomorrow's Diary" },
    { "<leader>zl", "<cmd>Obsidian dailies<cr>", desc = "Daily Notes List" },
    --     { "<leader>os", "<cmd>Obsidian quick_switch<cr>", desc = "Quick Switch" },
    --     { "<leader>of", "<cmd>Obsidian search<cr>", desc = "Search Notes" },
    --     { "<leader>oT", "<cmd>Obsidian template<cr>", desc = "Insert Template" },
    --     { "<leader>oN", "<cmd>Obsidian new_from_template<cr>", desc = "New from Template" },
    --     { "<leader>op", "<cmd>Obsidian paste_img<cr>", desc = "Paste Image" },
    --     { "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Backlinks" },
    --     { "<leader>oo", "<cmd>Obsidian open<cr>", desc = "Open in Obsidian" },
    { "<leader>zo", "<cmd>!typora %<cr>", desc = "Open in Typora" },
  },

  -- lazy.nvim command definitions (updated to new format)
  cmd = {
    "Obsidian",
  },

  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    -- Disable legacy commands (using new format now)
    legacy_commands = false,
    ui = {
      enable = false,
    },
    -- 工作区配置
    workspaces = {
      {
        name = "blog",
        path = "D:/blog",
      },
    },

    -- 新笔记存放位置
    notes_subdir = "content/posts/note",

    -- 日记配置 - 使用年月嵌套结构
    daily_notes = {
      folder = "content/diary",
      date_format = "%Y-%m-%d", -- 文件名格式: 2026-01-24.md
      template = "diary.md",
    },

    -- 自定义日记文件路径 - 使用独立模块处理
    note_path_func = function(spec)
      local Path = require("obsidian").Path
      local diary_path = require("utils.diary_path")

      -- 检查是否是日记笔记
      if diary_path.is_diary_path(tostring(spec.dir)) then
        -- 使用日记路径处理模块
        local file_path = diary_path.generate_diary_path_with_date(spec.dir, spec.id)

        if file_path then
          return Path.new(file_path)
        else
          -- 如果失败，回退到默认路径
          vim.notify("Using fallback path for diary", vim.log.levels.WARN)
          return spec.dir / tostring(spec.id)
        end
      else
        -- 普通笔记使用默认路径
        return spec.dir / tostring(spec.id)
      end
    end,

    -- 模板配置
    templates = {
      folder = "archetypes/nvim",
      date_format = "%Y-%m-%d", -- YYYY-MM-DD
      time_format = "%H:%M:%S", -- HH:mm:ss
      substitutions = {
        -- ISO 8601 格式的完整日期时间
        datetime = function()
          return os.date("%Y-%m-%dT%H:%M:%S%z")
        end,
        -- 昨天
        yesterday = function()
          return os.date("%Y-%m-%d", os.time() - 86400)
        end,
        -- 明天
        tomorrow = function()
          return os.date("%Y-%m-%d", os.time() + 86400)
        end,
        -- 周数
        week = function()
          return os.date("%Y-W%W")
        end,
        -- 当前时间（用于 stime）
        current_time = function()
          return os.date("%H:%M")
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

    -- 搜索配置
    search = {
      sort_by = "modified",
      sort_reversed = true,
    },

    -- 附件配置
    attachments = {
      folder = "static/images",
      img_name_func = function()
        return string.format("%s-", os.time())
      end,
    },
  },
}
