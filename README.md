# yenbekbay/dotfiles

```sh
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Activate Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install packages and apps
curl -fsSL https://raw.githubusercontent.com/yenbekbay/dotfiles/HEAD/Brewfile | brew bundle install --verbose --file=-

# Initialize chezmoi with the dotfiles repository
chezmoi init --apply --verbose https://github.com/yenbekbay/dotfiles.git
```
