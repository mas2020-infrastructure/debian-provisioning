# $1 argument represents the version of the Virtual Box Guest Addition to install
printf "\n\e[1;33m==> Installing guest additions $1...\e[0m\n"
# check parameter
if [[ -z $1 ]];
then
    printf "[\e[1;31mERROR\e[0m] version of guest additions is not set!"
    exit 1
fi

wget "http://download.virtualbox.org/virtualbox/$1/VBoxGuestAdditions_$1.iso"
sudo mkdir /media/VBoxGuestAdditions
sudo mount -o loop,ro VBoxGuestAdditions_$1.iso /media/VBoxGuestAdditions/
sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
rm VBoxGuestAdditions_$1.iso
sudo umount /media/VBoxGuestAdditions
sudo rmdir /media/VBoxGuestAdditions