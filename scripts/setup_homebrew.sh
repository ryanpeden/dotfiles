#!/usr/bin/env zsh

set -e

if ! command -v brew &> /dev/null; then
    echo "Error: Homebrew is not installed"
    exit 1
fi

BREWFILE="$(dirname "$0")/../packages/Brewfile"

brew update

if [ -f "$BREWFILE" ]; then
    brew bundle --file="$BREWFILE" --cleanup
fi

brew upgrade
brew cleanup
