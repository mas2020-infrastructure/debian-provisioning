#!/bin/bash
## This script aims to install oh-my-zsh utilities for zsh shell

# source file is we are in the right execution folder
if [ -f $(dirname "$0")/source.sh ]; then
  source $(dirname "$0")/source.sh
else
  printf "$SUB_ACT%s$STOP_COLOR\n" "source.sh not loaded, check to have the file in the same path as the sh script"
fi

# Script file to install the AWS cli tool
printf "$ACTIVITY Install OH-MY-ZSH framework...$STOP_COLOR\n"

printf "$SUB_ACT%s$STOP_COLOR\n" "Install the OH-MY-ZSH framework (dependencies installation)..."
sudo apt install -y curl wget git

printf "$SUB_ACT%s$STOP_COLOR\n" "Installing the OH-MY-ZSH framework..."
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o install.sh && chmod +x install.sh
./install.sh --unattended
# check error function (from source.sh)
check
rm ./install.sh

printf "$SUB_ACT%s$STOP_COLOR\n" "Add aliases to zsh"
# add aliases
echo "alias cl='clear'" >> "$HOME"/.zshrc
echo "alias ll='ls -l'" >> "$HOME"/.zshrc
echo "alias la='ls -la'" >> "$HOME"/.zshrc
#source "$HOME"/.zshrc
# check error function (from source.sh)
check