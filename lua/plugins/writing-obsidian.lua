local my_paths = vim.g.my_paths or {}

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  cmd = "Obsidian",
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
  },

  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    frontmatter = {
      enabled = false,
      func = function(note)
        local out = {}
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,
    },
    workspaces = {
      {
        name = "UofA",
        path = my_paths.uofa_vault or "D:/jinpeng6/Documents/UofA",
      },
      {
        name = "Blog",
        path = my_paths.blog_vault or "D:/A/Jeapo's blog",
        overrides = {
          notes_subdir = "content/posts/note",
          daily_notes = {
            enabled = true,
            folder = "content/diary",
            date_format = "%Y/%B/%Y-%m-%d",
            template = "diary.md",
          },
        },
      },
    },
    -- Default location for new notes.
    notes_subdir = "Notes",

    -- Default daily note layout for UofA: Notes/2026/06/20260613.md
    daily_notes = {
      enabled = true,
      folder = "Notes",
      date_format = "%Y/%m/%Y%m%d",
      template = "diary.md",
    },

    -- Template settings.
    templates = {
      folder = "archetypes/nvim",
      date_format = "%Y-%m-%d", -- YYYY-MM-DD
      time_format = "%H:%M:%S", -- HH:mm:ss
      substitutions = {
        -- Full ISO 8601-like date and time.
        datetime = function()
          return os.date("%Y-%m-%dT%H:%M:%S%z")
        end,
        -- Yesterday.
        yesterday = function()
          return os.date("%Y-%m-%d", os.time() - 86400)
        end,
        -- Tomorrow.
        tomorrow = function()
          return os.date("%Y-%m-%d", os.time() + 86400)
        end,
        -- Week number.
        week = function()
          return os.date("%Y-W%W")
        end,
        -- Current time for template snippets.
        current_time = function()
          return os.date("%H:%M")
        end,
      },
    },

    link = { style = "markdown" },
    search = {
      sort_by = "modified",
      sort_reversed = true,
    },

    -- Attachment settings.
    attachments = {
      folder = "static/images",
      img_name_func = function()
        return string.format("%s-", os.time())
      end,
    },
  },
}
