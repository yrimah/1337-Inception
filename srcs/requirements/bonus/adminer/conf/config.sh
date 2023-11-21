#!/bin/sh

cd /var/www/html

wget "http://www.adminer.org/latest.php" -O adminer.php

chmod 755 adminer.php

php -S 0.0.0.0:8080
