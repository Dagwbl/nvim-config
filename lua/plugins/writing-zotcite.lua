return {
  {
    "jalvesaq/zotcite", -- doesn't support zotero 8
    dependencies = { "nvim-telescope/telescope.nvim", "kkharji/sqlite.lua" },
    commit = "fbd2dcc",
    opts = {
      -- zotero_db_path = vim.g.my_paths.zotero_bib,
      zotero_sqlite_path = vim.g.my_paths.zotero_sqlite,
      key_type = "better-bibtex",
      open_in_zotero = true,
    },
  },
}
