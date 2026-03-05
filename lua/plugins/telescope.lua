return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-dap.nvim" },
      { "nvim-telescope/telescope-bibtex.nvim" },
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
    },
    keys = {
      { "<leader>fb", "<cmd>Telescope bibtex<CR>", desc = "[b]ibtex" },
      {
        "<C-S-i>",
        function()
          vim.cmd("stopinsert")
          vim.schedule(function()
            require("telescope").extensions.bibtex.bibtex()
          end)
        end,
        mode = "i",
        desc = "Insert BibTeX",
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {},
        extensions = {
          bibtex = {
            global_files = { vim.g.my_paths.zotero_bib },
            context = true,
            context_fallback = true,
            citation_format = "{{citekey}}",
            format = "quarto",
          },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("dap")
      telescope.load_extension("bibtex")
      -- telescope.load_extension("zotero")
    end,
  },
}
