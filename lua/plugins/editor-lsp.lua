return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      update_in_insert = false,
    },
    servers = {
      harper_ls = { enabled = false },
      ltex_plus = { enabled = false },
      ltex = { enabled = false },
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      },
    },
  },
}
