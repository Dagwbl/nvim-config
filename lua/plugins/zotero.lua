return {
  {
    "kkharji/sqlite.lua",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sqlite_clib_path = vim.fn.stdpath("config") .. "/sqlite/sqlite3.dll"
    end,
  },
  {
    "jalvesaq/zotcite",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
      zotero_db_path = vim.g.my_paths.zotero_bib,
    },
  },
}
