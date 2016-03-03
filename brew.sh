#!/usr/bin/env bash

# Install command-line tools and apps using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew, if we don't have it.
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install git tools.
brew install git
brew install git-extras
brew install git-flow
brew install legit
brew install tig
brew install hub

# Install Node.js, Python, pyenv, rbenv, and swiftenv.
brew install node
brew install python
brew install pyenv
brew install rbenv ruby-build
rbenv install 2.3.0
rbenv global 2.3.0
rbenv rehash
brew install kylef/formulae/swiftenv
swiftenv install swift-2.2-SNAPSHOT-2016-01-06-a
swiftenv global swift-2.2-SNAPSHOT-2016-01-06-a
swiftenv rehash

# Install essential binaries.
brew install the_silver_searcher
brew install tree
brew install wget
brew install trash
brew install zsh
brew install httpie
brew install jq
brew install fzf
command -v zsh | sudo tee -a /etc/shells

# Install iOS and OSX development tools.
brew install thoughtbot/formulae/liftoff
brew install keith/formulae/cocoapods
brew install jondot/tap/blade
brew install xctool

# Install other useful binaries.
brew install heroku-toolbelt
brew install imagemagick --with-webp
brew install webkit2png
brew install rename
brew install gist
brew install speedtest_cli
brew install htop-osx
brew install archey

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
 intellij-idea
 itsycal
 karabiner
 messenger
 mojibar
 mplayerx
 noizio
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
)

# Install apps with cask.
# Set the destination as /Applications instead of /Users/$user/Applications.
brew cask install --appdir="/Applications" ${apps[@]}

# Remove outdated versions from the cellar.
brew cask cleanup
brew cleanup
