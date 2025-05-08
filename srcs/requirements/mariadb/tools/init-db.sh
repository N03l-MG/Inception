#!/bin/bash

service mariadb start

mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mysql -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
mysql -u${DB_ROOT_USER} -p${DB_ROOT_PASS} -e "ALTER USER '${DB_ROOT_USER}'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u${DB_ROOT_USER} -p${DB_ROOT_PASS} shutdown

exec "$@"
