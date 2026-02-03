# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# Learning note

## `g` means Go to

- `gi`: Got to the last place you entered Insert mode.
-

## Z Mode

The `z` menu mode is an eclectic mix of cursor positioning, code folding, and random command.

**NEVER USE THE ARROW KEYS TO MOVE THE CURSOR.**

But recognize that if you ever have to push these keys more than twice in succession to move the cursor, you’re wasting keystrokes.

- `ge`: Go to end of previous word.
- `C-i`: To jump forward in history.
- `C-o` To jump forward in history

For example, if you are editing text rather than source code, you will find it useful to be able to navigate by sentences and paragraphs. Lzayvim further amends this collection of motions with other powerful navigation capabilities powered by a variety of plugins.

- `(`/`)`: Jump to a previous/next sentence.
- `{`/`}`: Jump to a previous/next blank line.
- `[{`/`]}`: Jump out to the beginning/end of the `{}`.


TODO:

FIXME: 

We can use `[t/]t` to jump to previous/next TODO or FIXME tag.

Seeking surrounding objects.

