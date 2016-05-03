#!/usr/bin/env bash

# Install Alcatraz
curl -fsSL https://raw.github.com/alcatraz/Alcatraz/mastelor/Scripts/install.sh | sh

# Install Azkaban
brew install neonichu/formulae/azkaban
brew cleanup

# Install Azkaban packages
azkaban install DBSmartPanels
azkaban install FixCode
azkaban install FuzzyAutocomplete
azkaban install Luft
azkaban install SwiftLintXcode
azkaban install VVDocumenter-Xcode
azkaban install XCActionBar

# Install Azkaban themes
azkaban install "Space Gray"
