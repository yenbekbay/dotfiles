#!/usr/bin/env bash

# Install mas
brew install mas

# Sign into the Mac App Store
mas signin ayan.yenb@me.com

# Install utility apps
brew cask install appcleaner
brew cask install flux
brew cask install hyperdock
brew cask install kap
brew cask install macclean
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quitter
brew cask install rocket
brew cask install suspicious-package
mas install 437151949 # Entropy
mas install 937984704 # Amphetamine
mas install 1082170746 # Aware
mas install 1000397973 # Wallcat

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
brew cask install zeplin
mas install 412448059 # ForkLift

# Install productivity apps
brew cask install itsycal
brew cask install dropbox
brew cask install rescuetime
brew cask install shiori
mas install 692867256 # Simplenote
mas install 409183694 # Keynote
mas install 443987910 # 1Password
mas install 409203825 # Numbers
mas install 409201541 # Pages

# Install news apps
mas install 880001334 # Reeder
mas install 568494494 # Pocket

# Install communication apps
brew cask install messenger
brew cask install whatsapp
brew cask install skype
brew cask install slack
brew cask install telegram
mas install 918858936 # Airmail
mas install 409789998 # Twitter

# Install media apps
brew cask install vlc
brew cask install webtorrent
mas install 731738567 # Permute
mas install 597611879 # Radium

# Install other apps
brew cask install google-photos-backup
brew cask install send-to-kindle
brew cask install transmission

# Remove outdated versions from the cellar
brew cask cleanup
