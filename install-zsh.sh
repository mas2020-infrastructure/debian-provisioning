#!/bin/bash
## This script aims to install zsh shell

# Parameters:
# $1 (optional): pass '-y' in case you want to set as a default shell
# $2 (optional): user name to set zsh as a default shell to

# source file is we are in the right execution folder
if [ -f $(dirname "$0")/source.sh ]; then
  source $(dirname "$0")/source.sh
else
  printf "$SUB_ACT%s$STOP_COLOR\n" "source.sh not loaded, check to have the file in the same path as the sh script"
fi

# Script file to install the AWS cli tool
printf "$ACTIVITY Install the latest version of zsh shell...$STOP_COLOR\n"

printf "$SUB_ACT%s$STOP_COLOR\n" "Update the system..."
sudo apt update -y

printf "$SUB_ACT%s$STOP_COLOR\n" "Install the zsh shell..."
# check if zsh already exist
if grep -q "zsh" /etc/shells; then
  printf "$SUB_ACT%s$STOP_COLOR\n" "zsh is already installed on the system"
  printf "$DONE\nbye\n"
  exit 0
fi
touch "$HOME"/.zshrc
sudo apt install -y zsh
zsh --version

#set -x
# check to set as a default shell
if [ -n "$1" ] && [ "$1" == "-y" ]; then
  printf "the actual shell is $SHELL\n"
  printf "$SUB_ACT%s$STOP_COLOR\n" "Set the zsh shell as the default..."
  sudo chsh -s $(which zsh) 
  # check error function (from source.sh)
  check

  if [ -n "$2" ]; then
    printf "$SUB_ACT%s$STOP_COLOR\n" "change default shell to $2..."
    sudo chsh -s $(which zsh) "$2"
    # check error function (from source.sh)
    check
  fi
fi
#set +x

printf "$SUB_ACT%s$STOP_COLOR\n" "Add aliases to zsh"
# add aliases
echo "alias cl='clear'" >> "$HOME"/.zshrc
echo "alias ll='ls -l'" >> "$HOME"/.zshrc
echo "alias la='ls -la'" >> "$HOME"/.zshrc
#source "$HOME"/.zshrc
# check error function (from source.sh)
check



