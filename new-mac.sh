#!/usr/bin/env bash

# Configure the environment for a new mac computer.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Xcode command line tools.
xcode-select --install
read -p "Press [Enter] key when Xcode command line tools are installed..."

# Copy dotfiles from Github.
cd ~
git clone --recursive https://github.com/yenbekbay/dotfiles.git dotfiles
cd ~/dotfiles

# Install Homebrew command-line tools and apps.
source brew.sh

# Install npm packages.
source npm.sh

# Install gems and PyPI packages.
gem install tugboat
gem install maid
gem install xcode-install
pip install thefuck
pip install pylint
pip install glances

# Install emojify
sudo sh -c "curl https://raw.githubusercontent.com/mrowa44/emojify/master/emojify -o /usr/local/bin/emojify && chmod +x /usr/local/bin/emojify"

# Synchronize symlinks.
set -- -f; source sync.sh

# Set Zsh as default shell.
chsh -s /usr/local/bin/zsh

# Configure git.
git config --global user.name "Ayan Yenbekbay"
git config --global user.email ayan.yenb@gmail.com

# Generate a new public key.
ssh-keygen -t rsa
echo "Add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

# Start maid launch daemon.
launchctl load ~/Library/LaunchAgents/me.yenbekbay.maid.plist

# Set OSX defaults.
source osx.sh
