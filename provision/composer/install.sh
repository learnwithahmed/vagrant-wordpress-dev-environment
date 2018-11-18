#!/usr/bin/env bash
 
echo "Installing composer.."
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
printf "\nPATH=\"$(sudo su - vagrant -c 'composer config -g home 2>/dev/null')/vendor/bin:\$PATH\"\n" | tee -a /home/vagrant/.profile
