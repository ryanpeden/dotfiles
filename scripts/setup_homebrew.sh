#!/usr/bin/env zsh

set -e

BREWFILE="$(dirname "$0")/../packages/Brewfile"

brew update

if [ -f "$BREWFILE" ]; then
    brew bundle --file="$BREWFILE" --cleanup
fi

brew upgrade
brew cleanup
