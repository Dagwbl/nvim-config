return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "jmbuhr/telescope-zotero.nvim",
        dependencies = {
          { "kkharji/sqlite.lua" },
        },
        opts = {
          -- Use ~ for home directory - works on both Windows and Linux!
          zotero_db_path = vim.fn.expand("~/Zotero/zotero.sqlite"),
          better_bibtex_db_path = vim.fn.expand("~/Zotero/better-bibtex.sqlite"),
          zotero_storage_path = vim.fn.expand("~/Zotero/storage"),
        },
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.load_extension("zotero")
    end,
  },
  {
    "kkharji/sqlite.lua",
    config = function()
      vim.g.sqlite_clib_path = vim.fn.stdpath("config") .. "/sqlite/sqlite3.dll"
    end,
  },
}
