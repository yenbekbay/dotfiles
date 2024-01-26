# Remove the default greeting
set -U fish_greeting

# Homebrew
eval (/opt/homebrew/bin/brew shellenv)
set -gx HOMEBREW_NO_ENV_HINTS true

# Starship
starship init fish | source

# mise-en-place
mise activate fish | source

# direnv
eval (direnv hook fish)
set -gx DIRENV_LOG_FORMAT ""

# sponge
set -g sponge_delay 10
set -g sponge_purge_only_on_exit true

# fzf
set -gx FZF_DEFAULT_OPTS --height 80% --reverse

# zoxide
zoxide init fish | source
set -gx _ZO_FZF_OPTS "$FZF_DEFAULT_OPTS --keep-right --exit-0 --select-1 --preview='command exa {2..}' --preview-window=bottom"

# forgit
set -gx FORGIT_FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS"
set -gx FORGIT_LOG_GRAPH_ENABLE true

# tabtab
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# Secretive
set -x SSH_AUTH_SOCK ~/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

# pnpm
set -gx PNPM_HOME ~/Library/pnpm
set -gx PATH "$PNPM_HOME" $PATH

# Android Studio
set -gx ANDROID_HOME ~/Library/Android/sdk
set -gx ANDROID_SDK_ROOT ~/Library/Android/sdk
set -gx ANDROID_AVD_HOME ~/.android/avd

# Tailscale
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
