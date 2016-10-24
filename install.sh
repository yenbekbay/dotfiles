#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Run the main dotfiles installation script
yes y | sh <(curl -fsSL https://raw.githubusercontent.com/anvilabs/dotfiles/master/install.sh)

# Clone local dotfiles from Github
git clone https://github.com/yenbekbay/dotfiles.git ~/.dotfiles-local

# Synchronize symlinks
rcup -v -d ~/.dotfiles-local/symlinks

# Install Cmake for building from source
brew install cmake

# Install git-extras for custom git aliases
brew install git-extras

# Install keybase and gpg for signatures
brew install keybase gnupg2

# Install yarn as a replacement for npm
brew install yarn

# Install system utilities
brew install tree
brew install wget
pip install glances

# Install general development tools
brew install asciinema
brew install httpie
brew install watchman
gem install bundler
yarn global add cloc
yarn global add greenkeeper
yarn global add npm-check
yarn global add travis
yarn global add trymodule
yarn global add yo
pip install pylint

# Install iOS and OSX development tools
brew install carthage
brew install jondot/tap/blade
brew install keith/formulae/cocoapods
brew install swiftlint
brew install thoughtbot/formulae/liftoff
gem install cocoapods-playgrounds
gem install fastlane
gem install synx
gem install xcode-install

# Install apps with brew cask and mas
source ~/.dotfiles-local/apps.sh

# Install vscode extensions
source ~/.dotfiles-local/vscode.sh

# Remove outdated versions from the cellar
brew cleanup

# Set up GPG
# https://anvilabs.co/blog/setup-gpg-commits/
echo "** Settings up GPG with Keybase"
keybase login
keybase pgp gen

# Set up SSH
# https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
echo "** Setting up SSH"
ssh-keygen -t rsa -b 4096 -C "ayan.yenb@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Open the GitHub settings page
open "https://github.com/account/keys"

# Add the SSH key to GitHub
pbcopy < ~/.ssh/id_rsa.pub
echo "SSH key copied to clipboard"
read -p "Press [Enter] key when you're done..."

# Add the PGP key to GitHub
keybase pgp export | pbcopy
echo "PGP key copied to clipboard"
read -p "Press [Enter] key when you're done..."
