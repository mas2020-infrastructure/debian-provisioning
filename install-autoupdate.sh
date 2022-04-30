USER=root
sudo tee /$USER/linux-update > /dev/null <<EOT
echo "" >> /root/system-update.txt
echo "\nUpdate Linux at $(date)" >> /$USER/system-update.txt && \
apt-get update >> /$USER/system-update.txt 2>&1 && \
apt-get -y upgrade >> /$USER/system-update.txt 2>&1 && \
apt-get -y autoremove >> /root/system-update.txt 2>&1
EOT

sudo chmod +x /$USER/linux-update

sudo tee -a /etc/crontab > /dev/null <<EOT
# set linux update at 16:00 every day
* 16 * * * root /$USER/linux-update
EOT
