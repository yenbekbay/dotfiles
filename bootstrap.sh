#!/usr/bin/env bash

# Configure the environment for a new mac computer.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Xcode command line tools.
xcode-select --install
read -p "Press [Enter] key when Xcode command line tools are installed..."

# Install Homebrew if we don't have it.
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install git tools.
brew install git
brwe install git-extras

# Install zsh.
brew install zsh
command -v zsh | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

# Install Node.js, Python, pyenv, and rbenv.
brew install node
brew install python
brew install pyenv
brew install rbenv ruby-build
rbenv install 2.3.0
rbenv global 2.3.0
rbenv rehash

# Install essential binaries.
brew install the_silver_searcher
brew install tree
brew install wget
brew install trash
brew install httpie
gem install maid

# Install iOS and OSX development tools.
brew install thoughtbot/formulae/liftoff
brew install keith/formulae/cocoapods
brew install carthage
brew install swiftlint
brew install jondot/tap/blade
gem install xcode-install
gem install fastlane
gem install synx
gem install cocoapods-playgrounds

# Install other useful binaries.
brew install heroku-toolbelt
gem install xcode-install
pip install thefuck
pip install pylint
pip install glances
npm install -g eslint
npm install -g yo
npm install -g hexo
npm install -g surge

# Install cask.
brew install caskroom/cask/brew-cask

apps=(
 atom
 chitchat
 dropbox
 droplr
 flux
 google-photos-backup
 hyperdock
 imageoptim
 karabiner
 messenger
 postico
 qlcolorcode
 qlmarkdown
 qlstephen
 send-to-kindle
 shiori
 skype
 slack
 soundcleod
 sourcetree
 spek
 suspicious-package
 telegram
 transmission
 vlc
)

# Install apps with cask.
# Set the destination as /Applications instead of /Users/$user/Applications.
brew cask install --appdir="/Applications" ${apps[@]}

# Remove outdated versions from the cellar.
brew cask cleanup
brew cleanup

# Configure Karabiner.
karabiner=/Applications/Karabiner.app/Contents/Library/bin/karabiner
$karabiner set repeat.wait 0
$karabiner set remap.toggle_wifi_by_fn_w 1
$karabiner set remap.launcher_mode_v2 1
$karabiner set remap.launch_itunes_by_play_button_twice 1

# Copy dotfiles from Github.
cd ~
git clone --recursive https://github.com/yenbekbay/dotfiles.git dotfiles
cd ~/dotfiles

# Synchronize symlinks.
set -- -f; source sync.sh

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
