#!/bin/bash

set -e

echo "Waiting 10s.."
sleep 10

if [ ! -f /var/www/html/wp-config.php ]; then
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER \
		--dbpass=$DB_PASS --dbhost=mariadb --allow-root  --skip-check

	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR \
		--admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL \
		--allow-root

	wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PASS --allow-root

	wp config  set WP_DEBUG true  --allow-root

	wp config set FORCE_SSL_ADMIN 'false' --allow-root

	wp config  set WP_CACHE 'true' --allow-root

	chmod 777 /var/www/html/wp-content

	wp theme install astra --activate --allow-root
fi

exec "$@"
