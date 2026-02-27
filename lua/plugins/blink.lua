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
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load({
            paths = { vim.fn.stdpath("config") .. "/snippets" },
          })
          require("luasnip.loaders.from_vscode").lazy_load({
            exclude = { "markdown", "quarto" },
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
      completion = {
        menu = { auto_show = true },
      },
      keymap = { preset = "super-tab" },
      enabled = function()
        return vim.g.blink_enabled ~= false
      end,
      snippets = { preset = "luasnip" },
      sources = {
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
          },
          snippets = {
            name = "Snippets",
            module = "blink.cmp.sources.snippets",
            transform_items = function(_, items)
              -- 获取光标前方的实时文本
              local col = vim.api.nvim_win_get_cursor(0)[2]
              local line = vim.api.nvim_get_current_line()
              local text_before_cursor = string.sub(line, 1, col)
              -- 用正则判断：当前光标前是否真的打出了 '@'
              local is_typing_at = string.match(text_before_cursor, "@[%w_-]*$") ~= nil
              -- 获取当前文件类型
              local ft = vim.bo.filetype
              return vim.tbl_filter(function(item)
                local label = item.label or ""
                local is_custom_at = string.sub(label, 1, 1) == "@"
                if ft == "markdown" or ft == "quarto" then
                  -- 🌟 绝对净化模式 (Markdown / Quarto)
                  -- 如果是 @ 开头的自定义片段，并且真的打了 @ 才放行
                  if is_custom_at then
                    return is_typing_at
                  end
                  -- 拦截掉所有其他任何片段（包括 friendly-snippets 的全局片段）！
                  return false
                else
                  -- 🌟 正常模式 (Lua / Python / MATLAB 等其他代码文件)
                  if is_custom_at then
                    return is_typing_at
                  end
                  -- 放行默认的代码片段
                  return true
                end
              end, items)
            end,
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
