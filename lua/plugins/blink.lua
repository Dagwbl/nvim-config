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
      -- Use the "super-tab" preset for VS Code-like behavior
      keymap = { preset = "super-tab" },
      -- enabled = function()
      --   return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
      --     and vim.bo.buftype ~= "prompt"
      --     and vim.b.completion_enabled ~= false
      -- end,
      sources = {
        default = { "avante" },
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
          },
        },
      },
    },
  },
}
