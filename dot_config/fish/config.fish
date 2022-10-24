# Remove the default greeting
set -U fish_greeting

# Configure fzf autocomplete (https://github.com/jethrokuan/fzf/wiki/FZF-Tab-Completions#fzf_complete--1-2-3)
set -U FZF_COMPLETE 2

# Initialize Homebrew (https://github.com/Homebrew/brew)
eval (/opt/homebrew/bin/brew shellenv)

# Initialize direnv (https://direnv.net/)
eval (direnv hook fish)

# Initialize Starship (https://starship.rs/)
starship init fish | source

# Initialize zoxide (https://github.com/ajeetdsouza/zoxide/)
zoxide init fish | source

# Initialize asdf (https://asdf-vm.com/)
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# Initialize Google Cloud SDK
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

# Add Android Studio environment variables
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export ANDROID_AVD_HOME=$HOME/.android/avd

# tabtab source for packages
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
