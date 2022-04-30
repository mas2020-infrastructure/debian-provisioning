# This file includes some useful variables to share with the scripts

# -- COLORS
export STOP_COLOR="\e[0m"
# color for a main activity
export ACTIVITY="\e[1m"
# color for a sub activity
export SUB_ACT="\e[1;34m➜\e[0m"
export DONE="\e[1;32mDONE\e[0m"
export ERROR="\e[1;31mERROR\e[0m:"
export WARNING="\e[0;33mWARNING\e[0m:"

# check function
check() {
  if [ $? -eq 0 ]; then 
    printf "$DONE\n"
  else
    printf "$ERROR\n"
  fi
}