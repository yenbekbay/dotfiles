#!/usr/bin/env bash

# Configure the environment for a new mac computer.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Installing Xcode command line tools.
gem install xcode-install
xcversion install-cli-tools

# Copy dotfiles from Github.
cd ~
git clone --recursive https://github.com/yenbekbay/dotfiles.git dotfiles
cd ~/dotfiles

# Install Homebrew command-line tools and apps.
source brew.sh

# Install gems and PyPI packages.
gem install tugboat
gem install maid
pip install thefuck
pip install pylint

# Install npm packages.
npm install jshint
npm install stylint

# Synchronize symlinks.
set -- -f; source sync.sh

# Set Zsh as default shell.
chsh -s /usr/local/bin/zsh

# Configure git.
# git config --global user.name "Ayan Yenbekbay"
# git config --global user.email ayan.yenb@gmail.com

# Start maid launch daemon.
launchctl load ~/Library/LaunchAgents/me.yenbekbay.maid.plist

# Set OSX defaults.
source osx.sh
