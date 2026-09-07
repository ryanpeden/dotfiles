#!/usr/bin/env zsh

set -euo pipefail

BREWFILE="$(dirname "$0")/../packages/Brewfile"

command -v brew >/dev/null 2>&1
[ -f "$BREWFILE" ]

brew update
brew bundle --file="$BREWFILE" --force-cleanup
