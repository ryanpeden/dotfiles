#!/usr/bin/env zsh

set -e

# Keyboard
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10

# Trackpad
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Finder
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/work/"
defaults write com.apple.finder ShowPathbar  -bool true

# Dock
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock tilesize -int 35

killall cfprefsd
killall Dock
killall Finder
