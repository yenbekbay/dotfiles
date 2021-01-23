# Remove the default greeting
set -U fish_greeting

# Initialize Homebrew (https://github.com/Homebrew/brew)
eval (/opt/homebrew/bin/brew shellenv)

# Initialize Starship (https://starship.rs/)
starship init fish | source

# Initialize direnv (https://direnv.net/)
eval (direnv hook fish)

# Initialize zoxide (https://github.com/ajeetdsouza/zoxide/)
zoxide init fish | source
