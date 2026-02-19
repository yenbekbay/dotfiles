#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'
umask 077

# Activate Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add fish to the know shells
if ! grep --quiet "$(which fish)" /etc/shells; then
  sudo "$(which bash)" -c 'echo "$(which fish)" >> /etc/shells'
fi

# Set fish as the default shell
chsh -s "$(which fish)"

# Add completions
chezmoi completion fish > ~/.config/fish/completions/chezmoi.fish
mise completion fish >~/.config/fish/completions/mise.fish
pnpm completion fish >~/.config/fish/completions/pnpm.fish
