#!/usr/bin/env bash

echo "Adding repositories.."
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get -y upgrade

echo "Installing apache + php.."
sudo apt-get install -y apache2
sudo apt-get install -y php7.2-fpm
sudo apt-get install -y php7.2-cli
sudo apt-get install -y php-gd
sudo apt-get install -y php-curl
sudo apt-get install -y php-mcrypt
sudo apt-get install -y php-mbstring
sudo apt-get install -y php-xml
sudo apt-get install -y php-soap
sudo apt-get install -y php-intl
sudo apt-get install -y php-mysql
sudo apt-get install -y libapache2-mod-php

# Some dev PHP settings
# php cli
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.2/cli/php.ini
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.2/cli/php.ini
sudo sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.2/cli/php.ini
sudo sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.2/cli/php.ini
# php fpm
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.2/fpm/php.ini
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.2/fpm/php.ini
sudo sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.2/fpm/php.ini
sudo sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.2/fpm/php.ini
sudo sed -i "s/upload_max_filesize = .*/upload_max_filesize = 100M/" /etc/php/7.2/fpm/php.ini
sudo sed -i "s/post_max_size = .*/post_max_size = 100M/" /etc/php/7.2/fpm/php.ini
sudo sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.2/fpm/php.ini

# setup hosts file
VHOST=$(cat <<EOF
<VirtualHost *:80>
	DocumentRoot "${1}"
	<Directory "${1}">
		AllowOverride All
		Require all granted
	</Directory>
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf

echo "Enabling apache modules.."
sudo a2enmod rewrite
sudo a2enmod headers
sudo a2enmod proxy_fcgi setenvif
sudo a2enconf php7.2-fpm

echo "Restarting apache.."
service apache2 restart

echo "Setting environment variables.."
echo "export ENV='local'" >> /etc/apache2/envvars
echo "export DOMAIN='${2}'" >> /etc/apache2/envvars
