#!/bin/bash

set -e

if [! -d "/var/lib/mysql" ]; then
  mysqld --initialize --user=mysql --datadir=/var/lib/mysql
  mysqld_safe --skip-networking &
  sleep 5
  
  mysql -u root << EOF
    CREATE DATABASE IF NOT EXISTS \`${db_name}\`;
	CREATE USER IF NOT EXISTS '${db_user}'@'%' IDENTIFIED BY '${db_pwd}';
	GRANT ALL PRIVILIGES ON \`${db_name}\` .* TO '${db_user}'@'%';
	FLUSH PRIVILIGES;
EOF

  mysqladmin shutdown
fi

exec mysqld
