#!/bin/bash

set -e

if [! -d "/var/lib/mysql" ]; then
  mysqld --initialize --user=mysql --datadir=/var/lib/mysql
  mysqld_safe --skip-networking &
  sleep 5
  
  mysql -u root << EOF
    CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
	CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
	GRANT ALL PRIVILIGES ON \`${DB_NAME}\` .* TO '${DB_USER}'@'%';
	FLUSH PRIVILIGES;
EOF

  mysqladmin shutdown
fi

exec mysqld
