# source file is we are in the right execution folder
if [ -f "debian-provisioning/source.sh" ]; then
    source debian-provisioning/source.sh
fi

# Parameters:

printf "${ACTIVITY}Installing package dependency for Terraform...$STOP_COLOR\n"
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install -y gnupg software-properties-common curl 2>&1 | tee -a $HOME/install-terraform.log
printf "$DONE\n"

# add the HashiCorp GPG key
printf "\n${ACTIVITY}Adding the HashiCorp GPG key...$STOP_COLOR\n"
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
if [ $? -eq 0 ]; 
  then printf "$DONE\n"
fi

# add the official HashiCorp Linux repository
printf "\n${ACTIVITY}Adding the official HashiCorp Linux repository....$STOP_COLOR\n"
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" 2>&1 | tee -a $HOME/install-terraform.log
if [ $? -eq 0 ]; 
  then printf "$DONE\n"
fi

printf "\n${ACTIVITY}Updating to add the repository, and installing the Terraform CLI....$STOP_COLOR\n"
sudo apt-get update 2>&1 | tee -a $HOME/install-terraform.log && sudo apt-get install terraform 2>&1 | tee -a $HOME/install-terraform.log
if [ $? -eq 0 ]; 
  then printf "$DONE\n"
fi

# verify the installation
terraform -help 2>&1 | tee -a $HOME/install-terraform.log
if [ $? -eq 0 ]; then 
  printf "to add the shell completion type: 'terraform -install-autocomplete'\n"
else
  printf "$ERROR error during installation, take a look at the $HOME/install-terraform.log file$STOP_COLOR\n"
fi