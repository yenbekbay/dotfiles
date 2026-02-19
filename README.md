# yenbekbay/dotfiles

```sh
# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/homebrew/install/HEAD/install.sh)"

# Activate homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install packages and apps
curl -fsSL https://raw.githubusercontent.com/yenbekbay/dotfiles/HEAD/Brewfile | brew bundle install --verbose --file=-

# Initialize chezmoi with the dotfiles repository
chezmoi init --apply --verbose https://github.com/yenbekbay/dotfiles.git

# Generate an SSH key pair
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -C "ayan.yenb@gmail.com" -a 100

# Add the private key to the ssh-agent and store it in the keychain
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# Add the public key to allowed_signers
echo "ayan.yenb@gmail.com $(cat ~/.ssh/id_ed25519.pub)" > ~/.config/git/allowed_signers
```
