#!/bin/bash
## Use this file as a template where to start to create a new script.

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
printf "$ACTIVITY Installing bla bla bla...$STOP_COLOR\n"