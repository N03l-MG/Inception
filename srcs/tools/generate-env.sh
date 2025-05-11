#!/bin/bash

echo "Populating environment file with secrets..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SECRETS_DIR="$SCRIPT_DIR/../../secrets"
ENV_FILE="$SCRIPT_DIR/../.env"

if [ ! -d "$SECRETS_DIR" ]; then
    echo "Error: Secrets directory not found!"
    echo "Please ensure the secrets directory exists with required credentials"
    exit 1
fi

mapfile -t CREDS < "$SECRETS_DIR/credentials.txt"

cat > "$ENV_FILE" << EOF
# WEB DOMAIN
DOMAIN_NAME=nmonzon.42.fr

# WORDPRESS SETUP
WP_TITLE=epicwebsite

WP_ADMIN_USR=${CREDS[0]}
WP_ADMIN_EMAIL=${CREDS[1]}
WP_ADMIN_PASS=$(cat "$SECRETS_DIR/wp_adminpass.txt")

WP_USR=${CREDS[2]}
WP_EMAIL=${CREDS[3]}
WP_PASS=$(cat "$SECRETS_DIR/wp_userpass.txt")

# DB SETUP
DB_NAME=wpdb

DB_ROOT_USER=${CREDS[4]}
DB_ROOT_PASS=$(cat "$SECRETS_DIR/db_rootpass.txt")

DB_USER=${CREDS[5]}
DB_PASS=$(cat "$SECRETS_DIR/db_pass.txt")

# DOCKER COMPOSE USER HOME VARIABLE
USER_HOME=/home/${USER}

EOF