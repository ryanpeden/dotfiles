#!/usr/bin/env zsh

set -euo pipefail

VIM_PLUG_PATH="$HOME/.vim/autoload/plug.vim"

command -v vim >/dev/null 2>&1

if [ ! -f "$VIM_PLUG_PATH" ]; then
    curl -fLo "$VIM_PLUG_PATH" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# vim-plug's PlugUpgrade/PlugUpdate exit 1 from -es mode even on success.
vim -es -u "$HOME/.vimrc" -i NONE -c "PlugUpgrade" -c "PlugUpdate" -c "PlugClean!" -c "qa" || true
