# AGENTS.md - Neovim Configuration Guidelines

This is a LazyVim-based Neovim configuration for academic writing, data science (Quarto), and personal knowledge management (Obsidian).

## Project Overview

- **Framework:** LazyVim (lazy.nvim plugin manager)
- **Platform:** Windows (multi-host: R7000, WVLIU-GD15)
- **Primary Focus:** Academic workflow, modal editing efficiency, AI-assisted editing

## Directory Structure

```
nvim/
├── lua/
│   ├── config/         # Core settings (options.lua, keymaps.lua, autocmds.lua, lazy.lua)
│   ├── plugins/       # Plugin specifications (one file per plugin/category)
│   └── utils/         # Custom utility modules
├── snippets/          # Custom completion snippets
├── stylua.toml        # Lua formatting config
├── lazyvim.json       # LazyVim extras configuration
└── .neoconf.json     # Neovim LSP configuration
```

## Build/Lint/Test Commands

Since this is a Neovim configuration (not a compiled project), the following commands apply:

### Development & Testing

- **Open Neovim:** `nvim` (from the nvim directory or any project)
- **Check plugin status:** `:Lazy` in Neovim, then press `check` or `h`
- **Sync plugins:** `:Lazy sync`
- **Check for updates:** `:Lazy check`
- **Plugin configuration issues:** `:Lazy debug`

### Lua Code Quality

- **Format Lua files:** Uses StyLua (configured in `stylua.toml`)
  - Run via: `:lua require("conform").format()` (if conform.nvim installed)
  - Or use StyLua CLI: `stylua --config stylua.toml .`
- **Lua LSP diagnostics:** Built-in via `lua_ls` (neoconf)
- **Check for errors:** `:lua vim.diagnostic.enable()` then `:lua vim.lsp.start_client()`

### Single Test Workflow

There are no formal unit tests for this Neovim config. To test changes:

1. Make changes to a plugin file in `lua/plugins/`
2. Run `:Lazy sync` to reload
3. Restart Neovim or `:edit %` to reload the current config file
4. Verify the plugin loads: `:Lazy` → check the plugin is loaded

### Debugging Tips

- **Check loaded plugins:** `:lua vim.print(vim.tbl_keys(require("lazy").plugins()))`
- **Check autocmds:** `:autocmd`
- **Check keymaps:** `:map` or `:lua vim.print(vim.tbl_keys(vim.keymap.get()))`
- **Log output:** `:messages` or check `stdpath("state")/logs/`

## Code Style Guidelines

### Lua Conventions

- **Indentation:** 2 spaces (enforced by `stylua.toml`)
- **Line length:** Max 120 characters
- **Column width:** 120 (configured in `stylua.toml`)
- **Quote style:** Double quotes for strings
- **Semicolons:** Not used

### Naming Conventions

- **Files:** Snake_case (e.g., `ai-avante.lua`, `smart-splits.lua`)
- **Variables:** snake_case (e.g., `my_paths`, `zotero_bib`)
- **Functions:** camelCase (e.g., `get_config`, `push_current_file`)
- **Modules:** Require with dots: `require("utils.push_today")`
- **Plugin spec keys:** Use lazy.nvim spec format (see below)

### Plugin Specification Format

Follow this pattern in `lua/plugins/*.lua`:

```lua
return {
  "author/plugin-name",
  event = "VeryLazy",  -- or "BufReadPre", etc.
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    -- configuration options
  },
  config = function()
    -- setup code
  end,
}
```

### Imports & Requires

- **LazyVim plugins:** `{ import = "lazyvim.plugins.extras.ai.avante" }` in `lazyvim.json`
- **Custom plugins:** Add to `lua/plugins/` directory
- **Built-in plugins:** Use LazyVim extras in `lazyvim.json`
- **Neovim API:** Use `vim.api.*` for advanced operations

### Keymap Conventions

- **Leader keymaps:** Use `<leader>` prefix
- **Custom system shortcuts:** Use `<leader>z` prefix (reserved for custom tooling)
- **Escape alternatives:** `jk` or `jj` in insert mode
- **Normal from insert:** `;;` for single command execution
- **Descriptive labels:** Always include `desc` field

Example:
```lua
vim.keymap.set("n", "<leader>zh", function()
  Snacks.dashboard()
end, { desc = "Home Dashboard" })
```

### Options & Settings

- **Global options:** Set in `lua/config/options.lua` using `vim.opt` or `vim.g`
- **Host-specific paths:** Use `vim.uv.os_gethostname()` to detect machine
- **Neovide-specific:** Check `vim.g.neovide` for GUI settings

Example:
```lua
local hostname = vim.uv.os_gethostname()
if hostname == "R7000" then
  my_paths = { ... }
elseif hostname == "WVLIU-GD15" then
  my_paths = { ... }
end
```

### Error Handling

- **Safe function calls:** Use `pcall` for potentially missing plugins
  ```lua
  pcall(function()
    require("blink.cmp").hide()
  end)
  ```
- **Shell commands:** Check `vim.v.shell_error` after `vim.fn.system`
- **Plugin failures:** Use `:Lazy` to identify broken plugins

### Formatting

- **Lua files:** Run StyLua before committing
- **Markdown:** Uses Prettier (LazyVim extra)
- **JSON/TOML:** Uses built-in formatters

## Existing Documentation

- `README.md` - User-facing documentation and keybindings
- `GEMINI.md` - Gemini CLI-specific maintenance guidelines
- `lazyvim.json` - LazyVim extras (plugins from LazyVim distribution)

## Important Constraints

1. **No Arrow Keys:** Strict "No Arrow Keys" philosophy in keymap design
2. **Modal Efficiency:** Prioritize motions and operators
3. **Host-Specific Logic:** Never hardcode paths; use `vim.g.my_paths`
4. **Quarto/Zotero Integration:** Maintain academic workflow plugins
5. **AI Plugins:** Currently uses `avante.nvim` with Copilot provider

## Additional Notes

- Theme: Catppuccin (supports dark/light toggle with `<leader>zT`)
- Font: Iosevka Nerd Font / JetBrainsMono
- Uses `snacks.nvim` for dashboard, terminal, and zen mode
- Uses `blink.cmp` for completion with toggleable ghost text (`<leader>zb`)
