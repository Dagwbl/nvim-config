return {
  {
    "jalvesaq/zotcite",
    dependencies = { "nvim-telescope/telescope.nvim", "kkharji/sqlite.lua" },
    opts = {
      zotero_db_path = vim.g.my_paths.zotero_bib,
    },
  },
}
