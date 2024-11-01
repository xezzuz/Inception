#!/bin/bash

mv ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

sleep 5

mariadb -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"

mariadb -e "CREATE USER IF NOT EXISTS \`$USR_NAME\`@'%' IDENTIFIED BY '$USR_PASS';"

mariadb -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO \`$USR_NAME\`@'%';"

mariadb -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$ROOT_PASS shutdown

mysqld_safe