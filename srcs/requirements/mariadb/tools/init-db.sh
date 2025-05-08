#!/bin/bash

service mariadb start

expect /tmp/secure-db.exp $DB_ROOT_PASS

mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASS}';"
mysql -e "FLUSH PRIVILEGES;"

service mariadb stop

exec "$@"
