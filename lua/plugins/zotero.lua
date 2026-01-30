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
    "jmbuhr/telescope-zotero.nvim",
    dependencies = {
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
    config = function()
      require("zotero").setup({
        zotero_db_path = vim.fn.expand("~/Zotero/zotero.sqlite"),
        better_bibtex_db_path = vim.fn.expand("~/Zotero/better-bibtex.sqlite"),
        zotero_storage_path = vim.fn.expand("~/Zotero/storage"),
      })
    end,
  },
}
