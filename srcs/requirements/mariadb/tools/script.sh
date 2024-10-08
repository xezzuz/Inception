#!/bin/bash

echo mariadb-script

mv ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

echo mariadb-script-1

sleep 5

mariadb -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"

mariadb -e "CREATE USER IF NOT EXISTS '$USR_NAME'@'%' IDENTIFIED BY '$USR_PASS';"

mariadb -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$USR_NAME'@'%';"

mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASS';"

mariadb -e "FLUSH PRIVILEGES;" -p$ROOT_PASS

mysqladmin -u root -p$ROOT_PASS shutdown

mysqld_safe --bind-address=0.0.0.0