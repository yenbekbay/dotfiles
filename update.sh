#!/usr/bin/env bash

PATH=${PATH}:/usr/local/bin
PATH=${PATH}:$HOME/.rbenv/bin
export PATH=${PATH}
export NVM_DIR="$HOME/.nvm"

wget -q --spider http://google.com

if [ $? -eq 0 ]; then
  echo "** Updating brew"
  brew update

  echo "** Updating brew packages"
  brew upgrade --all

  echo "** Updating brew apps"
  brew cask update

  echo "** Cleaning up brew cellar"
  brew cleanup
  brew cask cleanup

  echo "** Updating dotfiles submodules"
  (cd ~/.dotfiles && git submodule foreach git pull origin master)

  echo "** Updating gems"
  eval "$(rbenv init -)"
  gem update

  echo "** Updating global npm packages"
  source $(brew --prefix nvm)/nvm.sh
  npm update -g

  echo ""
else
  echo "No internet connection"
fi
