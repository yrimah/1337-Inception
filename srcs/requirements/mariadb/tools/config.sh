#!/bin/sh

service mariadb start
#service mariadb enable

admin_pass="Yrimah42*ri@@"

#mysql -e "UPDATE mysql.user SET Password = PASSWORD('$admin_pass') WHERE User = 'root'"

#mysql -e "DROP USER IF EXISTS ''@'localhost'"

#mysql -e "DROP DATABASE IF EXISTS test"

mysql -e "CREATE DATABASE IF NOT EXISTS wordpress"

mysql -e "CREATE USER IF NOT EXISTS 'yrimah42'@'127.0.0.1' IDENTIFIED BY 'Yrimah42*ri@@'"

mysql -e "GRANT ALL PRIVILEGES ON wordpress.* to 'yrimah42'@'127.0.0.1'"

mysql -e "FLUSH PRIVILEGES"
