#!/bin/sh

mkdir -p $WP_PATH

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod u+x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp cli update

sed -i 's#listen = /run/php/php8.2-fpm.sock#listen = 9000#' /etc/php/8.2/fpm/pool.d/www.conf

FILE="/var/www/html/wp-config.php"

if [ ! -f "$FILE" ]; then
	wp core download --path=$WP_PATH --allow-root

	wp core config --dbname=$MYSQL_DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_DB_HOST --path=$WP_PATH --allow-root

	wp core install --url=$DOMAIN_NAME --title='inception' --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --path=$WP_PATH --allow-root

	wp user create $WP_USER $WP_USER_EMAIL --role='author' --user_pass=$WP_USER_PASSWORD --path=$WP_PATH --allow-root
else
	echo "Success : Getting files from volume..."
fi

/usr/sbin/php-fpm8.2 -F