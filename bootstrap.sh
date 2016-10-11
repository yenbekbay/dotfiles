#!/usr/bin/env bash

# Configure the environment for a new mac computer

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Xcode command line tools
xcode-select --install
read -p "Press [Enter] key when Xcode command line tools are installed..."

# Install Homebrew if we don't have it
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade --all

# Install Cmake for building from source
brew install cmake

# Install git
brew install git git-extras

# Install zsh
brew install zsh
sudo chsh -s $(which zsh)

# Install rcm
brew install thoughtbot/formulae/rcm

# Clone dotfiles from Github
git clone --recursive https://github.com/yenbekbay/dotfiles.git ~/.dotfiles

# Synchronize symlinks
rcup -v -d ~/.dotfiles/symlinks

# Copy fonts
rsync -av --no-perms ~/.dotfiles/fonts/ ~/Library/Fonts

# Configure python environment
brew install pyenv
pyenv install 3.5.2
pyenv global 3.5.2
pyenv rehash

# Configure ruby environment
brew install rbenv ruby-build
rbenv install 2.3.1
rbenv global 2.3.1
rbenv rehash

# Configure node environment
curl -fsSL http://git.io/n-install | sh
n latest

# Configure powerline-shell
ln -s ~/.dotfiles/powerline-config.py ~/.dotfiles/powerline-shell/config.py
(cd ~/.dotfiles/powerline-shell && python install.py)

# Configure vim
brew install vim
mkdir ~/.vim/autoload
ln -s ~/.dotfiles/vim-plug/plug.vim ~/.vim/autoload/plug.vim

# Install tmux
brew install tmux

# Install system utilities
brew install the_silver_searcher
brew install trash
brew install tree
brew install wget
pip install glances

# Install general development tools
brew install httpie
gem install bundler
npm install -g npm-check
npm install -g trymodule
npm install -g yo
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

# Install cask
brew tap caskroom/cask
sudo chflags hidden /opt

# Install utility apps
brew cask install appcleaner
brew cask install flux
brew cask install hyperdock
brew cask install licecap
brew cask install macclean
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quitter
brew cask install suspicious-package

# Install development apps
brew cask install docker
brew cask install docker-toolbox
brew cask install hyper
brew cask install imageoptim
brew cask install medis
brew cask install mongodb
brew cask install mongohub
brew cask install postico
brew cask install postman
brew cask install sourcetree
brew cask install visual-studio-code

# Install productivity apps
brew cask install itsycal
brew cask install dropbox
brew cask install rescuetime
brew cask install shiori

# Install communication apps
brew cask install messenger
brew cask install whatsapp
brew cask install skype
brew cask install slack
brew cask install telegram

# Install media apps
brew cask install vlc
brew cask install webtorrent

# Install other apps
brew cask install google-photos-backup
brew cask install send-to-kindle
brew cask install transmission

# Remove outdated versions from the cellar
brew cask cleanup
brew cleanup

# Generate a new public key
ssh-keygen -t rsa
echo "Add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

# Add a cron job to update installed packages
cat > ~/Library/LaunchAgents/me.yenbekbay.update.plist <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>me.yenbekbay.update</string>
    <key>ProgramArguments</key>
    <array>
      <string>sh</string>
      <string>-c</string>
      <string>$HOME/.dotfiles/update.sh | while IFS= read -r line; do printf '[%s] %s\n' "\$(date '+%Y-%m-%d %H:%M:%S')" "\$line"; done</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>StartCalendarInterval</key>
    <dict>
      <key>Hour</key>
      <integer>12</integer>
      <key>Minute</key>
      <integer>10</integer>
    </dict>
    <key>StandardErrorPath</key>
    <string>$HOME/.dotfiles/update.log</string>
    <key>StandardOutPath</key>
    <string>$HOME/.dotfiles/update.log</string>
  </dict>
</plist>
EOF
launchctl load ~/Library/LaunchAgents/me.yenbekbay.update.plist
