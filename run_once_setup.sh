#!/usr/bin/env bash

# Use the Unofficial Bash Strict Mode: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

# Activate Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install packages and apps using Homebrew Bundle: https://github.com/Homebrew/homebrew-bundle
brew bundle install --file "$(chezmoi source-path)/Brewfile"

# Add fish to the know shells
if ! grep --quiet "$(which fish)" /etc/shells; then
  sudo "$(which bash)" -c 'echo "$(which fish)" >> /etc/shells'
fi

# Set fish as the default shell
chsh -s "$(which fish)"

# Install fish plugins
fisher update

# Install asdf plugins
asdf plugin add nodejs
asdf plugin add ruby
asdf plugin-add pnpm
