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
