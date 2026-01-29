return {
  {
    "jmbuhr/telescope-zotero.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "kkharji/sqlite.lua" },
    config = function()
      require("telescope").load_extension("zotero")
    end,
  },
  {
    "kkharji/sqlite.lua",
    config = function()
      vim.g.sqlite_clib_path = vim.fn.stdpath("config") .. "/sqlite/sqlite3.dll"
    end,
  },
  {
    "jalvesaq/zotcite",
    ft = { "markdown", "rmarkdown", "quarto", "tex", "plaintex" },
    config = function()
      require("zotcite").setup({
        zotero_sqlite_path = "C:/Users/jeapo/Zotero/zotero.sqlite",
      })
    end,
  },
}
