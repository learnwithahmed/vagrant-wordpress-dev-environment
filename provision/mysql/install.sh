#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

dbDump=$3/provision/mysql/dump.sql

echo "Setting environment variables.."
echo "export DB_HOST='127.0.0.1'" >> /etc/apache2/envvars
echo "export DB_NAME='${1}'" >> /etc/apache2/envvars
echo "export DB_USER='root'" >> /etc/apache2/envvars
echo "export DB_PASSWORD='${2}'" >> /etc/apache2/envvars

echo "Installing mysql.."

# Repository for latest MySQL
# http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/#repo-qg-apt-repo-manual-setup
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5072E1F5
echo "deb http://repo.mysql.com/apt/ubuntu/ trusty mysql-5.7" | sudo tee /etc/apt/sources.list.d/mysql.list

# Update after adding repositories
sudo apt-get update

# Install MySQL non-interactively
debconf-set-selections <<< "mysql-community-server mysql-community-server/data-dir select ''"
debconf-set-selections <<< "mysql-community-server mysql-community-server/root-pass password $2"
debconf-set-selections <<< "mysql-community-server mysql-community-server/re-root-pass password $2"

sudo apt-get install -y mysql-server

# Set Timezone (Server/MySQL)
sudo ln -sf /usr/share/zoneinfo/UTC /etc/localtime
sudo mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql --user=$2 --password=$2 mysql

echo "Creating database.."
sudo mysql -uroot -p$2 -e "create database $1;"

if [ -f $dbDump ]; then 
	echo "Importing dump.."
	sudo mysql -uroot -p$2 $1 < $dbDump
fi