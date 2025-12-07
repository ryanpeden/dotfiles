#!/usr/bin/env zsh

set -e

VIM_PLUG_PATH="${HOME}/.vim/autoload/plug.vim"

if [ ! -f "$VIM_PLUG_PATH" ]; then
    curl -fLo "$VIM_PLUG_PATH" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

vim -es -u "$HOME/.vimrc" -i NONE -c "PlugUpgrade" -c "PlugUpdate" -c "PlugClean!" -c "qa" || true
