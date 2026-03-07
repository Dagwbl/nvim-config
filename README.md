# 🚀 Personal Neovim Configuration

A customized [LazyVim](https://github.com/LazyVim/LazyVim) setup tailored for **Academic Writing**, **Data Science (Quarto)**, and **Personal Knowledge Management (Obsidian)**.

## 📚 Core Focus
- **Academic Workflow:** Deep integration with Zotero for citations and Quarto for reproducible research.
- **Knowledge Management:** Optimized Obsidian integration with custom directory structures for daily notes.
- **Modal Efficiency:** A strict "No Arrow Keys" philosophy, utilizing advanced Vim motions and custom helpers.
- **AI-Powered:** Agentic editing with `avante.nvim`.

## 🛠️ Key Technology Stack
- **Framework:** LazyVim (Plugin management via `lazy.nvim`).
- **Writing:** `quarto-nvim`, `obsidian.nvim`, `zotcite`, `markdowny.lua`.
- **AI:** `avante.nvim` (configured with Copilot/Claude).
- **UI & Utils:** `snacks.nvim` (Dashboard, Terminal, Zen Mode), `blink.cmp` (Completion), `neovide` (GUI support).
- **Navigation:** `smart-splits.nvim`, `telescope.nvim`.

## ⌨️ Custom Keybindings

### The `<leader>z` System Menu
Most personal and system-level shortcuts are prefixed with `<leader>z`.

| Keymap | Action |
| --- | --- |
| `<leader>zh` | Open Home Dashboard (Snacks) |
| `<leader>zs` | Show current file in Windows Explorer |
| `<leader>zo` | Open current file in default system app |
| `<leader>zc` | Search/Insert Zotero citations |
| `<leader>zp` | Toggle Quarto Preview |
| `<leader>zT` | Toggle Dark/Light Mode (Catppuccin) |
| `<leader>zP` | Push current file to Git (custom utility) |
| `<leader>zb` | Toggle Blink Ghost Text |

### Editing & Navigation
- **Escape:** `jk` or `jj` in Insert mode.
- **One-shot Normal:** `;;` in Insert mode to execute a single command.
- **Hashtag:** `<leader>h` adds a `#` before the current word (useful for tagging).
- **Zen Mode:** `<leader>uz` to toggle focus mode.

---

## 🧠 Neovim Concepts & Cheatsheet

### 1. The Grammar of Vim (Verb + Adjective + Noun)
Vim is a language. Once you learn the grammar, you don't memorize shortcuts; you speak to the editor.

- **Verbs (Operators):** `d` (delete), `c` (change), `y` (yank/copy), `v` (visual select).
- **Adjectives (Text Objects):** `i` (inner), `a` (around).
- **Nouns:** `w` (word), `s` (sentence), `p` (paragraph), `t` (tag), `"` (quotes), `(` (parentheses), `b` (block).

*Example:* `ci"` means "Change Inside Quotes". `dap` means "Delete Around Paragraph".

### 2. Powerful Text Objects
| Object | Description |
| --- | --- |
| `it` / `at` | Inner/Around HTML/XML Tag |
| `i"` / `a"` | Inner/Around Double Quotes |
| `i(` / `a(` | Inner/Around Parentheses |
| `ip` / `ap` | Inner/Around Paragraph |

### 3. Essential Power-User Commands
| Command | Effect |
| --- | --- |
| `.` | **The Dot Command:** Repeat the last change. The most powerful key in Vim. |
| `*` / `#` | Search for the word under the cursor (forward/backward). |
| `gv` | Re-select the last visual selection. |
| `gx` | Open the link/file under the cursor. |
| `Ctrl-v` | Visual Block mode (great for multi-line prepending). |
| `:%s/old/new/gc` | Search and replace in the whole file with confirmation. |

### 4. Macros: Automating Repetition
1. `qa`: Start recording into register `a`.
2. *Perform your actions.*
3. `q`: Stop recording.
4. `@a`: Play back the macro in register `a`.
5. `@@`: Play back the last used macro.

---

## 📂 Structure
- `lua/config/`: Core settings (`options.lua`, `keymaps.lua`).
- `lua/plugins/`: Modular plugin specifications.
- `lua/utils/`: Custom scripts (e.g., Git pushing, dynamic diary paths).
- `snippets/`: Custom completions for Quarto and Hugo.

## 🖥️ Environment Support
This config uses host-specific path detection in `options.lua` to handle different environments (e.g., `R7000` vs `WVLIU-GD15`), ensuring Zotero databases and project roots are always correctly mapped.

---

## 💡 Learning Notes

### Z Mode & Modal Editing
*The `z` menu is for cursor positioning, folding, and navigation. If you have to push a key more than twice to move, you’re wasting keystrokes.*

- `ge`: Go to end of previous word.
- `C-i` / `C-o`: Jump forward/backward in jump history.
- `(`/`)`: Jump by sentences.
- `{`/`}`: Jump by blank lines.
- `[t` / `]t`: Jump to previous/next TODO or FIXME.
- `gi`: Go to the last place you entered Insert mode.
