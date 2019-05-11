#!/usr/bin/env bash

# Install mas
brew install mas

# Sign into the Mac App Store
mas signin ayan.yenb@me.com

# Install utility apps
brew cask install alfred
brew cask install appcleaner
brew cask install cloudapp
brew cask install coconutbattery
brew cask install dozer
brew cask install kap
brew cask install keka
brew cask install lulu
brew cask install mullvadvpn
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quitter
brew cask install rescuetime
brew cask install shifty
brew cask install smcfancontrol
brew cask install spectacle
brew cask install yujitach-menumeters
mas install 937984704 # Amphetamine
mas install 1082170746 # Aware
mas install 1000397973 # Wallcat

# Install development apps
brew cask install devdocs
brew cask install docker
brew cask install docker-toolbox
brew cask install hyper
brew cask install imageoptim
brew cask install insomnia
brew cask install medis
brew cask install mongodb
brew cask install mongohub
brew cask install postico
brew cask install redis-app
brew cask install sourcetree
brew cask install vagrant
brew cask install visual-studio-code
brew cask install ngrok
mas install 412448059 # ForkLift

# Install productivity apps
brew cask install dropbox
brew cask install enpass
brew cask install google-backup-and-sync
brew cask install itsycal
brew cask install lukakerr/things/pine
brew cask install notion
brew cask install shiori
brew cask install toggl
brew cask install yandex-disk
mas install 692867256 # Simplenote
mas install 409183694 # Keynote
mas install 443987910 # 1Password
mas install 409203825 # Numbers
mas install 409201541 # Pages
mas install 585829637 # Todoist

# Install news apps
mas install 568494494 # Pocket

# Install communication apps
brew cask install messenger
brew cask install whatsapp
brew cask install skype
brew cask install slack
brew cask install telegram-desktop
mas install 1176895641 # Spark

# Install media apps
brew cask install caption
brew cask install deezer
brew cask install iina
brew cask install soda-player
brew cask install fog
mas install 731738567 # Permute

# Install other apps
brew cask install transmission

# Remove outdated versions from the cellar
brew cask cleanup
