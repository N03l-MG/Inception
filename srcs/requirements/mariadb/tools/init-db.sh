#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
    # Initialize MySQL data directory
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    # Start MySQL service
    mysqld --user=mysql &
    
    # Wait for MySQL to start
    until mysqladmin ping >/dev/null 2>&1; do
        sleep 1
    done

    # Create database and users
    mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS ${db1_name};
CREATE USER IF NOT EXISTS '${db1_user}'@'%' IDENTIFIED BY '${db1_pwd}';
GRANT ALL PRIVILEGES ON ${db1_name}.* TO '${db1_user}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';
FLUSH PRIVILEGES;
EOF

    # Stop MySQL
    mysqladmin -u root shutdown
fi

# Execute CMD
exec "$@"
