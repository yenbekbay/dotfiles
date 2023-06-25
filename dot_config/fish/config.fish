# Remove the default greeting
set -U fish_greeting

# fzf autocomplete (https://github.com/jethrokuan/fzf/wiki/FZF-Tab-Completions#fzf_complete--1-2-3)
set -U FZF_COMPLETE 2

# Homebrew (https://github.com/Homebrew/brew)
eval (/opt/homebrew/bin/brew shellenv)

# direnv (https://direnv.net/)
eval (direnv hook fish)

# Starship (https://starship.rs/)
starship init fish | source

# zoxide (https://github.com/ajeetdsouza/zoxide/)
zoxide init fish | source

# asdf (https://asdf-vm.com/)
source "$(brew --prefix asdf)/libexec/asdf.fish"

# Google Cloud SDK
source "$(brew --prefix)/share/google-cloud-sdk/path.fish.inc"

# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export ANDROID_AVD_HOME=$HOME/.android/avd

# tabtab
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# pnpm
set -gx PNPM_HOME /Users/yenbekbay/Library/pnpm
set -gx PATH "$PNPM_HOME" $PATH

# Secretive
set -x SSH_AUTH_SOCK /Users/yenbekbay/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
