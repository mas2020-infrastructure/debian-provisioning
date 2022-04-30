# source file is we are in the right execution folder
if [ -f "debian-provisioning/source.sh" ]; then
    source debian-provisioning/source.sh
fi

# Script file to install the AWS cli tool
printf "${ACTIVITY}Installing the latest version of AWS CLI...$STOP_COLOR\n"

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
sudo ./aws/install

if [ $? -eq 0 ]; 
  then printf "$DONE\n";
fi
/usr/local/bin/aws --version