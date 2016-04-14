#!/bin/bash

#sudo apt-get update &&
#sudo apt-get -y install lamp-server^ &&
#sudo apt-get -y install php5-common php5-gd php-pear php-db libapache2-mod-php5 php-mail &&
#sudo apt-get -y install freeradius freeradius-mysql freeradius-utils

#sudo mysql -u root -ppassword -e "create database radius"
#works good until this point

sudo mysql -u root -ppassword -e "grant all on radius.* to radius@localhost identified by 'password'"


#maunal commands work until this point

#sudo mysql -u root -ppassword radius < /etc/freeradius/sql/mysql/schema.sql
#sudo mysql -u root -ppassword radius < /etc/freeradius/sql/mysql/nas.sql


mysql -u root -ppassword -e "use radius;INSERT INTO radcheck (UserName, Attribute, Value) VALUES ('sqltest', 'Password', 'testpwd');"

cp /etc/freeradius/sql.conf /etc/freeradius/sql.conf.bak

sed -e 's/radpass/password/g' -e 's/#readclients/readclients/g' /etc/freeradius/sql.conf > /etc/freeradius/sql1.conf

mv /etc/freeradius/sql1.conf /etc/freeradius/sql.conf

sed -i '406 s/^#//' /etc/freeradius/sites-enabled/default
sed -i '454 s/^#//' /etc/freeradius/sites-enabled/default
sed -i '475 s/^#//' /etc/freeradius/sites-enabled/default

sed -i '700 s/^#//' /etc/freeradius/radiusd.conf

service freeradius stop

