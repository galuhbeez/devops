#!/bin/bash

#sudo apt-get update &&
#sudo apt-get -y install lamp-server^ &&
#sudo apt-get -y install php5-common php5-gd php-pear php-db libapache2-mod-php5 php-mail &&
#sudo apt-get -y install freeradius freeradius-mysql freeradius-utils

#sudo mysql -u root -ppassword -e "create database radius"
#works good until this point

sudo mysql -u root -ppassword -e "grant all on radius.* to radius@localhost identified by 'password'"
