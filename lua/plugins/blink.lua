return {
  {
    "rafamadriz/friendly-snippets",
    lazy = true,
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        opts = {
          -- history = false,
          -- update_events = "TextChanged,TextChangedI",
        },
        config = function(_, opts)
          require("luasnip").setup(opts)
          require("luasnip.loaders.from_vscode").lazy_load({
            paths = { vim.fn.stdpath("config") .. "/snippets" },
          })
          -- require("luasnip.loaders.from_vscode").lazy_load({
          --   exclude = { "markdown", "quarto", "all" },
          -- })
        end,
      },
      {
        "krissen/blink-cmp-bibtex",
      },
      {
        "saghen/blink.compat",
        dev = false,
        opts = { impersonate_nvim_cmp = false, enable_events = true },
      },
      {
        "jmbuhr/cmp-pandoc-references",
        dev = false,
        ft = { "quarto", "markdown", "rmarkdown" },
      },
      { "moyiz/blink-emoji.nvim" },
      { "kdheepak/cmp-latex-symbols" },
      { "erooke/blink-cmp-latex" },
    },
    opts = {
      completion = {
        menu = { auto_show = true },
      },
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
      },
      enabled = function()
        return vim.g.blink_enabled ~= false
      end,
      sources = {
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
          },
          -- snippets = { preset = "luasnip" },
          -- snippets = {
          --   name = "Snippets",
          --   module = "blink.cmp.sources.snippets",
          --   transform_items = function(_, items)
          --     local ft = vim.bo.filetype
          --     local is_md = (ft == "markdown" or ft == "quarto")
          --
          --     local col = vim.api.nvim_win_get_cursor(0)[2]
          --     local line = vim.api.nvim_get_current_line()
          --     local text_before_cursor = string.sub(line, 1, col)
          --     local is_typing_at = string.match(text_before_cursor, "@[%w_-]*$") ~= nil
          --
          --     return vim.tbl_filter(function(item)
          --       local label = item.label or ""
          --       -- 64 就是 '@' 的 ASCII 码，这比 string.sub(label, 1, 1) 快非常多
          --       local is_custom_at = (string.byte(label, 1) == 64)
          --
          --       if is_md then
          --         if is_custom_at then
          --           return is_typing_at
          --         end
          --         return false
          --       else
          --         if is_custom_at then
          --           return is_typing_at
          --         end
          --         return true
          --       end
          --     end, items)
          --   end,
          -- },
          emoji = {
            module = "blink-emoji",
            name = "Emoji",
            score_offset = -1,
            enabled = function()
              return vim.tbl_contains({ "markdown", "quarto" }, vim.bo.filetype)
            end,
          },
          bibtex = {
            name = "BibTeX",
            module = "blink-cmp-bibtex",
            score_offset = 200,
            max_items = 100,
            opts = {
              filetypes = { "tex", "plaintex", "markdown", "rmd", "typst", "quarto" },
              files = { "references.bib" }, -- Local project files
              global_files = {
                vim.g.my_paths.zotero_bib,
              },
              search_paths = { vim.fn.expand(vim.g.my_paths.zotero_bib) },
            },
          },
          references = {
            name = "pandoc_references",
            module = "cmp-pandoc-references.blink",
            score_offset = 300,
          },
          latex_symbols = {
            name = "latex_symbols",
            module = "blink.compat.source",
            opts = {
              source_name = "latex_symbols",
              strategy = 2, --insert latex rather than symbol
            },
          },
          latex = {
            name = "Latex",
            module = "blink-cmp-latex",
            opts = {
              insert_command = function(ctx)
                local ft = vim.api.nvim_get_option_value("filetype", {
                  scope = "local",
                  buf = ctx.bufnr,
                })
                if ft == "tex" or ft == "latex" then
                  return true
                end
                return false
              end,
            },
          },
        },
        default = { "lsp", "path", "snippets", "buffer", "avante" },

        per_filetype = {
          markdown = { "lsp", "path", "references", "latex_symbols", "emoji", "latex", "bibtex", "snippets" },
          quarto = { "lsp", "path", "references", "latex_symbols", "emoji", "latex", "bibtex", "snippets" },
        },
      },
    },
  },
}
