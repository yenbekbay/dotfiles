DEFAULT_USER="ayan.yenb@gmail.com"
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_UPDATE=true
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

unsetopt NOMATCH
setopt APPEND_HISTORY
setopt INTERACTIVE_COMMENTS

source ~/dotfiles/zgen/zgen.zsh
source ~/dotfiles/.aliases
source ~/dotfiles/.functions
source ~/dotfiles/.exports

if ! zgen saved; then
  zgen oh-my-zsh

  zgen oh-my-zsh plugins/osx
  zgen oh-my-zsh plugins/brew
  zgen oh-my-zsh plugins/brew-cask
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/git-extras
  zgen oh-my-zsh plugins/git-flow
  zgen oh-my-zsh plugins/github
  zgen oh-my-zsh plugins/bundler
  zgen oh-my-zsh plugins/gem
  zgen oh-my-zsh plugins/httpie
  zgen oh-my-zsh plugins/history
  zgen oh-my-zsh plugins/node
  zgen oh-my-zsh plugins/npm
  zgen oh-my-zsh plugins/pip
  zgen oh-my-zsh plugins/pod
  zgen oh-my-zsh plugins/python
  zgen oh-my-zsh plugins/ruby
  zgen oh-my-zsh plugins/tugboat
  zgen oh-my-zsh plugins/heroku
  zgen oh-my-zsh plugins/z

  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions src
  zgen load b4b4r07/emoji-cli
  zgen load uvaes/fzf-marks
  zgen load rimraf/k

  zgen oh-my-zsh themes/clean

  zgen save
fi

eval "$(rbenv init -)"

if [ "$TERM" != "linux" ]; then
  install_powerline_precmd
fi
