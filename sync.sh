#!/usr/bin/env bash

cd ~/dotfiles

synchronize() {
	rsync -avh --no-perms --exclude 'bin/' --exclude 'LaunchAgents/' symlinks/ ~
  rsync -avh --no-perms symlinks/bin/ /usr/local/bin
  rsync -avh --no-perms symlinks/LaunchAgents/ ~/Library/LaunchAgents
	rsync -avh --no-perms fonts/ ~/Library/Fonts/
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	synchronize
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		synchronize
	fi
fi
unset synchronize
