#!/usr/bin/env bash

# Install Xcode packages using Alcatraz.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Alcatraz.
curl -fsSL https://raw.github.com/alcatraz/Alcatraz/master/Scripts/install.sh | sh
# Install Azkaban.
brew install neonichu/formulae/azkaban

# Install Azkaban packages.
azkaban install BBUncrustifyPlugin
azkaban install DBSmartPanels
azkaban install Luft
azkaban install VVDocumenter-Xcode
azkaban install XCActionBar
azkaban install XcodeColors
azkaban install KSImageNamed
azkaban install OMQuickHelp
azkaban install FixCode

# Install Azkaban themes.
azkaban install "Space Gray"
