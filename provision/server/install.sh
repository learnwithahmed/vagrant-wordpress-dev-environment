#!/usr/bin/env bash

echo "Updating server..."
sudo apt-get update

# Install Basics: Utilities and some Python dev tools
sudo apt-get install -y python-software-properties
sudo apt-get install -y build-essential
sudo apt-get install -y git
sudo apt-get install -y vim
sudo apt-get install -y curl
sudo apt-get install -y wget
sudo apt-get install -y zip
sudo apt-get install -y unzip
sudo apt-get install -y pigz
sudo apt-get install -y python-pip
sudo apt-get install -y python-dev

# setup swap file
if [ -f /swapfile ]; then
    echo "The Swap file already exists."
else
    sudo fallocate -l 4G /swapfile
    sudo chmod 600 /swapfile
    sudo mkswap /swapfile
    sudo swapon /swapfile
    sudo sh -c 'echo "/swapfile   none    swap    sw    0   0" >> /etc/fstab'
    sudo sh -c 'echo "vm.swappiness = 60" >> /etc/sysctl.conf' # 60 for desktops, closer to 0 for VPS (10?)
    sudo sh -c 'echo "vm.vfs_cache_pressure = 50" >> /etc/sysctl.conf'
    echo "The Swap file is created and added to '/etc/fstab' to make the changes permanent."
fi

# setup timezone
sudo timedatectl set-timezone Europe/Stockholm

# Add user "vagrant" to group www-data
sudo usermod -a -G www-data vagrant

# Allow caching of NFS file share
sudo apt-get install -y cachefilesd
echo "RUN=yes" | sudo tee /etc/default/cachefilesd
