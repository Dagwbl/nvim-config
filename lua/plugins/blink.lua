return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      { "krissen/blink-cmp-bibtex" },
      { "Kaiser-Yang/blink-cmp-avante" },
      { "jmbuhr/cmp-pandoc-references", dev = false, ft = { "quarto", "markdown", "rmarkdown" } },
      { "moyiz/blink-emoji.nvim" },
      { "erooke/blink-cmp-latex" },
    },
    opts = {
      completion = {
        menu = {
          auto_show = function(ctx, items)
            return not vim.g.writing_ft[vim.bo.filetype]
          end,
          auto_show_delay_ms = function(ctx, items)
            return vim.g.writing_ft[vim.bo.filetype] and 1000 or 0
          end,
        },
        ghost_text = {
          enabled = function()
            return vim.g.ghost_text_enabled ~= false
          end,
        },
      },
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
      },
      -- enabled = function()
      --   return vim.g.blink_enabled ~= false
      -- end,
      sources = {
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "avante",
          },
          snippets = {
            name = "snippets",
            module = "blink.cmp.sources.snippets",
            opts = {
              friendly_snippets = true,
              search_paths = { vim.fn.stdpath("config") .. "/snippets" },
              -- extended_filetypes = {
              --   markdown = { "tex" },
              --   quarto = { "tex" },
              -- },
            },
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
          latex = {
            name = "Latex",
            module = "blink-cmp-latex",
            opts = {
              insert_command = function(ctx)
                local ft = vim.api.nvim_get_option_value("filetype", {
                  scope = "local",
                  buf = ctx.bufnr,
                })
                if ft == "tex" or ft == "latex" or ft == "markdown" or ft == "quarto" then
                  return true
                end
                return false
              end,
            },
          },
        },

        default = { "lsp", "path", "snippets", "buffer", "avante" },

        per_filetype = {
          markdown = { "lsp", "path", "references", "emoji", "bibtex", "snippets", "latex" },
          quarto = { "lsp", "path", "references", "emoji", "bibtex", "snippets", "latex" },
        },
      },
    },
  },
}
