return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-dap.nvim" },
      -- {
      --   "jmbuhr/telescope-zotero.nvim", -- this and zotcite doesn't support zwtero 8
      --   dev = false,
      --   dependencies = {
      --     {
      --       "kkharji/sqlite.lua",
      --       config = function()
      --         vim.g.sqlite_clib_path = vim.fn.stdpath("config") .. "/sqlite/sqlite3.dll"
      --       end,
      --     },
      --   },
      --   config = function()
      --     local zotero = require("zotero")
      --
      --     -- local collection = nil
      --     -- if vim.fn.getcwd():match("phd%-thesis") then
      --     --   collection = "phd-thesis"
      --     -- end
      --
      --     zotero.setup({
      --       -- collection = collection,
      --       zotero_db_path = vim.g.my_paths.zotero_sqlite,
      --       -- better_bibtex_db_path = "~/Zotero/better-bibtex.sqlite",
      --       zotero_storage_path = vim.g.my_paths.zotero_storage,
      --       pdf_opener = nil,
      --     })
      --     vim.keymap.set("n", "<leader>fz", ":Telescope zotero<cr>", { desc = "[z]otero" })
      --   end,
      -- },
      {
        "nvim-telescope/telescope-bibtex.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        keys = {
          { "<leader>fb", "<cmd>Telescope bibtex<CR>", desc = "[b]ibtex" },
          { "<C-b>", "<cmd>Telescope bibtex<CR>", mode = "i", desc = "Insert [b]ibtex" },
        },
        config = function()
          require("telescope").setup({
            extensions = {
              bibtex = {
                bibfiles = {
                  vim.g.my_paths.zotero_bib,
                },
                citation_format = "{{citekey}}",
                -- custom_formats = {
                --   { id = "myCoolFormat", cite_marker = "#%s#" },
                -- },
                format = "markdown",
              },
            },
          })

          require("telescope").load_extension("bibtex")
        end,
      },
    },
  },
}
