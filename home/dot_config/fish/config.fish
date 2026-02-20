# homebrew
eval (/opt/homebrew/bin/brew shellenv)
set -gx HOMEBREW_NO_ENV_HINTS 1

# starship
starship init fish | source

# mise-en-place
mise activate fish --shims | source

# direnv
eval (direnv hook fish)

# fzf
fzf --fish | source
set -gx FZF_DEFAULT_OPTS --reverse

# zoxide
zoxide init fish | source
set -gx _ZO_FZF_OPTS "$FZF_DEFAULT_OPTS --preview='command eza {2..}' --preview-window=bottom"

# pnpm
set -gx PNPM_HOME ~/Library/pnpm
set -gx PATH "$PNPM_HOME" $PATH

# java
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# Android Studio
set -gx ANDROID_HOME ~/Library/Android/sdk
set -gx PATH "$ANDROID_HOME/emulator" $PATH
set -gx PATH "$ANDROID_HOME/platform-tools" $PATH
