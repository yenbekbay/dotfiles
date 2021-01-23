#!/usr/bin/env bash

# Use the Unofficial Bash Strict Mode: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

# Install Homebrew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Activate Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install chezmoi
brew install chezmoi

# Install 1Password CLI
brew install 1password-cli

# Sign into 1Password account
eval "$(op signin alkafinance.1password.com ayan.yenb@gmail.com)"

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

# Replace current process with chezmoi init
chezmoi init --apply "--source=$script_dir"
