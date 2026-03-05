return {
  {
    "hedyhli/outline.nvim",
    dependencies = {
      "epheien/outline-treesitter-provider.nvim",
    },
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      providers = {
        priority = { "lsp", "markdown", "norg", "treesitter", "man" },
        markdown = {
          filetypes = { "markdown", "quarto", "rmd" },
        },
        treesitter = {
          filetypes = { "quarto", "markdown" },
        },
      },
      outline_window = {
        position = "left",
        auto_jump = true,
        -- show_relative_numbers = true,
      },
      symbols = {
        icon_fetcher = function(k, buf)
          local ft = vim.bo[buf].filetype
          if (ft == "markdown" or ft == "quarto") and k == "String" then
            return "" -- 也可以换成你喜欢的 Nerd Font 图标，比如 "§ 󰒍 " 或 "📌 "
          end
          return false
        end,
        filter = { "String", "Function", "Class", "Module" },
      },
      outline_items = {
        show_symbol_details = false,
        auto_set_cursor = true,
      },
      guides = {
        enabled = false,
        markers = {
          bottom = "\u{2570}", --  ╰
          middle = "\u{251c}", --  ├
          vertical = "\u{2502}", --  │
        },
      },
      symbol_folding = {
        autofold_depth = 2,
      },
    },
  },
}
