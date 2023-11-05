#!/bin/sh

apt-get install curl -y


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp cli update

mkdir /var/www/html

wp core download --path=/var/www/html/ --allow-root

wp core config --dbname=wordpress --dbuser=yrimah42 --dbpass=Yrimah42*ri@@ --path=/var/www/html/ --allow-root

wp core install --url=yrimah.42.fr --title=ineption --admin_user=yrimah42 --admin_password=Yrimah42*ri@@ --admin_email=yrimah42@gmail.com --path=/var/www/html --allow-root
