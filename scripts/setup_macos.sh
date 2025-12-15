#!/usr/bin/env zsh

set -e

# ==============================================================================
# Defaults
# ==============================================================================

# Keyboard
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Trackpad
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write -g com.apple.trackpad.scaling -float 2.5

# Finder
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/work/"
defaults write com.apple.finder ShowPathbar -bool true

# Dock
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock tilesize -int 35

# Menu Bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Dialogs
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

# ==============================================================================
# Dock
# ==============================================================================

DOCK_APPS=(
    "/Applications/Google Chrome.app"
    "/System/Applications/Notes.app"
    "/Applications/Spotify.app"
    "/System/Applications/Podcasts.app"
    "/System/Applications/Photos.app"
    "/Applications/Visual Studio Code.app"
    "/System/Applications/Utilities/Terminal.app"
    "/Applications/zoom.us.app"
    "/Applications/Citrix Workspace.app"
    "/System/Applications/System Settings.app"
)

dockutil --remove all --no-restart

for app in "${DOCK_APPS[@]}"; do
    [[ -d "$app" ]] && dockutil --add "$app" --no-restart
done

[[ -d "$HOME/work" ]] && dockutil --add "$HOME/work" --view list --display folder --sort name --no-restart
[[ -d "$HOME/Downloads" ]] && dockutil --add "$HOME/Downloads" --view auto --display stack --sort datemodified --no-restart

# ==============================================================================
# Restart
# ==============================================================================

killall cfprefsd
killall Dock
killall Finder
