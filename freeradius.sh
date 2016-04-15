#!/bin/bash

apt-get update &&
apt-get -y install lamp-server^ &&
apt-get -y install php5-common php5-gd php-pear php-db libapache2-mod-php5 php-mail &&
apt-get -y install freeradius freeradius-mysql freeradius-utils

mysql -u root -ppassword -e "create database radius"
mysql -u root -ppassword -e "grant all on radius.* to radius@localhost identified by 'password'"
mysql -u root -ppassword radius < /etc/freeradius/sql/mysql/schema.sql
mysql -u root -ppassword radius < /etc/freeradius/sql/mysql/nas.sql
mysql -u root -ppassword -e "use radius;INSERT INTO radcheck (UserName, Attribute, Value) VALUES ('sqltest', 'Password', 'testpwd');"

cp /etc/freeradius/sql.conf /etc/freeradius/sql.conf.bak
sed -e 's/radpass/password/g' -e 's/#readclients/readclients/g' /etc/freeradius/sql.conf > /etc/freeradius/sql1.conf
mv /etc/freeradius/sql1.conf /etc/freeradius/sql.conf

sed -i '406 s/^#//' /etc/freeradius/sites-enabled/default
sed -i '454 s/^#//' /etc/freeradius/sites-enabled/default
sed -i '475 s/^#//' /etc/freeradius/sites-enabled/default

sed -i '700 s/^#//' /etc/freeradius/radiusd.conf

service freeradius stop
service freeradius start

wget https://sourceforge.net/projects/daloradius/files/daloradius/daloradius0.9-9/daloradius-0.9-9.tar.gz/download

mv download daloradius-0.9-9.tar.gz

tar xvfz daloradius-0.9-9.tar.gz
mv daloradius-0.9-9 daloradius
mv daloradius /var/www

chown www-data:www-data /var/www/daloradius -R
chmod 644 /var/www/daloradius/library/daloradius.conf.php

cd /var/www/daloradius/contrib/db
mysql -u root -ppassword radius < mysql-daloradius.sql
cp /var/www/daloradius/library/daloradius.conf.php /var/www/daloradius/library/daloradius.conf.php.bak
cp /home/ubuntu/daloradius.conf.php.new /var/www/daloradius/library/daloradius.conf.php

#for vagrant
#cp /vagrant/daloradius.conf.php.new /var/www/daloradius/library/daloradius.conf.php


echo "Alias /daloradius /var/www/daloradius/

<Directory /var/www/daloradius/>
Options None
Order allow,deny
allow from all
</Directory>" > /etc/apache2/sites-available/daloradius.conf

a2ensite daloradius

service apache2 reload


echo "that's all folks"
