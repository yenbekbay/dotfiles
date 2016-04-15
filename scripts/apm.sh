#!/usr/bin/env bash

# Install Atom packages using apm.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Atom.
brew cask install --appdir="/Applications" atom
brew cask cleanup

# Install Atom packages.
apm install atom-beautify
apm install atom-ternjs
apm install atom-ternjs
apm install auto-detect-indentation
apm install auto-update-packages
apm install autocomplete-modules
apm install docblockr
apm install editorconfig
apm install file-icons
apm install git-projects
apm install linter
apm install linter-eslint
apm install linter-pylint
apm install merge-conflicts
apm install minimap
apm install sort-lines
apm install tabs-to-spaces
apm install trailing-spaces

# Install Atom themes.
apm install nucleus-dark-ui
apm install spacegray-atom-dark-syntax
