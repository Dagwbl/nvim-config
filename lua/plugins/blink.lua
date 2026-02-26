return {
  {
    "saghen/blink.cmp",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load({
            paths = { vim.fn.stdpath("config") .. "/snippets" },
          })
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
      keymap = { preset = "super-tab" },
      enabled = function()
        return vim.g.blink_enabled ~= false
      end,

      sources = {
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
          },
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
          markdown = { "lsp", "path", "references", "latex_symbols", "emoji", "latex", "bibtex" },
          quarto = { "lsp", "path", "references", "latex_symbols", "emoji", "latex", "bibtex" },
        },
      },
    },
  },
}
