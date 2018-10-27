#!/bin/bash 

service mysql start
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "USE mysql; UPDATE user SET password=PASSWORD('$MYSQL_ROOT_PASS') WHERE User='root' AND Host = 'localhost';"
while true; do sleep 1000; done
