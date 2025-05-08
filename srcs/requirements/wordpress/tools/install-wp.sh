#!/bin/bash

set -e

while ! mysqladmin ping -h mariadb --silent; do
  sleep 10
done

if [ ! -f /var/www/html/wp-config.php ]; then
  wget https://wordpress.org/latest.zip
  unzip latest.zip -d /tmp/
  mv /tmp/wordpress/* /var/www/html/
  chown -R www-data:www-data /var/www/html
fi

exec pfp-fpm7.4 -F
