# Install docker in the system

# Parameters:
# $1 argument represents the docker-compose version to install (e.g. 1.29.1)
# $2 represent to user to attach the docker group
if [ -f $(dirname "$0")/source.sh ]; then
  source $(dirname "$0")/source.sh
else
  printf "$SUB_ACT%s$STOP_COLOR\n" "source.sh not loaded, check to have the file in the same path as the sh script"
fi

printf "\e[1;33m==> Install last version of docker and docker-compose...\e[0m\n"

if [[ -z $1 ]];
then
    printf "\e[1;31m[ERROR]\e[0m docker compose version is not set!\n"
    exit 1
fi
if [[ -z $2 ]];
then
    printf "\e[1;31m[ERROR]\e[0m docker user is not set!\n"
    exit 1
fi

printf "\e[0;97m==> Install package dependency for Docker...\e[0m\n"
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common &>> $HOME/install-docker.log

# add the GPG key for the official Docker repository to your system
curl -fsS -o docker-pub-key https://download.docker.com/linux/ubuntu/gpg && sudo apt-key add docker-pub-key &>> $HOME/install-docker.log
sudo rm docker-pub-key
if [ $? -eq 0 ]; 
  then printf "\e[1;32m[DONE]\e[0m\n";
fi

# add the Docker repository to APT sources
printf "\n\e[0;97m==> Add apt Docker repository...\e[0m\n"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" &>> $HOME/install-docker.log
if [ $? -eq 0 ]; 
  then printf "\e[1;32m[DONE]\e[0m\n";
fi

printf "\n\e[0;97m==> Package update...\e[0m\n"
sudo apt-get update -y &>> $HOME/install-docker.log
if [ $? -eq 0 ]; 
  then printf "\e[1;32m[DONE]\e[0m\n";
fi

# install docker
printf "\n\e[0;97m==> Installation of Docker CE for '${2}' user...\e[0m\n"
sudo apt-get install -y docker-ce &>> $HOME/install-docker.log
sudo usermod -aG docker ${2} &>> $HOME/install-docker.log
if [ $? -eq 0 ]; 
  then printf "\e[1;32m[DONE]\e[0m\n";
fi

# install docker-compose
printf "\n\e[0;97m==> Installation of docker compose $1...\e[0m\n"
sudo curl -sL "https://github.com/docker/compose/releases/download/$1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
if [ $? -eq 0 ]; 
  then printf "\e[1;32m[DONE]\e[0m\n";
fi
