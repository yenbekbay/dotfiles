#!/usr/bin/env bash

# Configure Karabiner.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Karabiner.
brew cask install --appdir="/Applications" karabiner
brew cask cleanup

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set repeat.wait 0
/bin/echo -n .
$cli set remap.toggle_wifi_by_fn_w 1
/bin/echo -n .
$cli set remap.launcher_mode_v2 1
/bin/echo -n .
$cli set remap.launch_itunes_by_play_button_twice 1
/bin/echo -n .
/bin/echo
