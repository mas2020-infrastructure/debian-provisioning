#!/bin/bash
## Install Homebrew package manager

# Parameters:
# $1 (optional|required): bla bla bla
# $1 (optional|required): bla bla bla

# source file is we are in the right execution folder
if [ -f $(dirname "$0")/source.sh ]; then
  source $(dirname "$0")/source.sh
  echo "ok"
else
  printf "$SUB_ACT%s$STOP_COLOR\n" "source.sh not loaded, check to have the file in the same path as install-zsh.sh"
fi

# Start point
printf "$ACTIVITY Installing Homebrew...$STOP_COLOR\n"
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o install.sh && chmod +x install.sh
./install.sh

printf "$SUB_ACT Setting Homebrew variables...$STOP_COLOR\n"
# set the correct env variables
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.bash_profile
test -r ~/.zshrc && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.zshrc
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.profile
check
