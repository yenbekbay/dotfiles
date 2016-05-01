# Unix aliases
alias e="$EDITOR"
alias mkdir="mkdir -p"

# Mac OS X aliases
alias unhidelibrary="chflags nohidden ~/Library"
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

# Replacements
alias ls="k -h"
alias lss="ls -ah"
alias rm=trash

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# Other aliases
alias dotfiles="rcup -v -d ~/.dotfiles/symlinks"
alias ip="curl ipinfo.io/ip"
