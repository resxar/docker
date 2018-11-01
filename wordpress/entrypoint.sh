#!/bin/bash

service apache2 start
service php7.2-fpm start
sed -i "s/database_name_here/$MYSQL_DATABASE/g" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/$MYSQL_USER/g" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/html/wordpress/wp-config.php
sed -i "s/localhost/$MYSQL_HOST/g" /var/www/html/wordpress/wp-config.php
chown -R www-data:www-data /var/www/html/wordpress
while true; do sleep 1000; done
