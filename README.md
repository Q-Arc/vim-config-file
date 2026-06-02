# My Minimal, Vim Config

A lightweight, vanilla `~/.vimrc` optimized for configuration editing and fluid prose writing.

## Custom Shortcuts
* `Space` + `s` -> Toggle British English spellcheck
* `Space` + `Space` -> Clear search highlights
* `Q` (in Normal mode) -> Cleanly re-format/wrap the current paragraph
* `j` / `k` -> Navigate smoothly by visual wrapped lines

## Manual Setup Prerequisite

Before dropping this file in, make sure your local backup folders exist:

mkdir -p ~/.vim/{backup,swap,undo}

mkdir ~/vimwiki

Remember to check home-manager. ~/.config/home-manager/home.nix for plugin stuff when use.
