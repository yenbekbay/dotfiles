#!/usr/bin/env bash

# Configure the environment for a new mac computer.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

npm install -g eslint
npm install -g itunes-remote
npm install -g app-stats
npm install -g is-up-cli
npm install -g pageres-cli
npm install -g viewport-list-cli
npm install -g mobicon-cli
npm install -g clog-cli
npm install -g fkill-cli
