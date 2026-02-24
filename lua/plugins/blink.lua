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
    },
    opts = {
      keymap = { preset = "super-tab" },
      enabled = function()
        return vim.g.blink_enabled
      end,

      sources = {
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
          },
        },
        default = {
          "buffer",
          "path",
          "lsp",
          "snippets",
          "avante", -- 保留给代码文件
        },
        per_filetype = {
          markdown = { "lsp", "path" }, -- "buffer" removed
          quarto = { "lsp", "path" }, -- "buffer" removed
        },
      },
    },
  },
}
