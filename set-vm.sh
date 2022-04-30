# source file is we are in the right execution folder
if [ -f $(dirname "$0")/source.sh ]; then
  source $(dirname "$0")/source.sh
else
  printf "$SUB_ACT%s$STOP_COLOR\n" "source.sh not loaded, check to have the file in the same path as the sh script"
fi

# Inserimento aliasing
printf "\n${ACTIVITY}Set vm with aliases and base packages...$STOP_COLOR\n"
echo "alias cl='clear'" > .bash_aliases

printf "\n${ACTIVITY}Updating & upgrading packages...$STOP_COLOR\n"
sudo apt-get update 2>&1 | tee -a $HOME/set-vm.log && sudo apt-get upgrade -y 2>&1 | tee -a $HOME/set-vm.log
if [ $? -eq 0 ]; 
  then printf "$DONE\n";
fi

printf "\n${ACTIVITY}Installing base tools...$STOP_COLOR\n"
sudo apt-get --fix-broken install -y
sudo apt-get install -y net-tools unzip htop tree build-essential linux-headers-$(uname -r) whatweb 2>&1 | tee -a $HOME/set-vm.log
if [ $? -eq 0 ]; 
  then printf "$DONE\n";
fi