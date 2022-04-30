# source file is we are in the right execution folder
if [ -f $(dirname "$0")/source.sh ]; then
  source $(dirname "$0")/source.sh
else
  printf "$SUB_ACT%s$STOP_COLOR\n" "source.sh not loaded, check to have the file in the same path as the sh script"
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