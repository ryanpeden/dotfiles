#!/usr/bin/env zsh

set -e

brew update
brew bundle --file="$(dirname "$0")/../packages/Brewfile"
brew upgrade
brew cleanup
