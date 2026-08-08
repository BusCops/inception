#!/bin/sh

set -e

cd /var/www/html

if [ ! -f /var/www/wordpress/wp-config.php ]; then
    echo "Downloading WordPress core files..."
    wp core download --allow-root

    echo "WordPress core files downloaded."

    echo "Creating wp-config.php..."
    
    wp config create \
    --allow-root \
    --dbname=$MYSQL_DATABASE \
    --dbuser=$MYSQL_USER \
    --dbpass=$DB_PASSWORD \
    --dbhost=$MYSQL_HOST \
    
    echo "Installing WordPress and setting up the admin ..."

    wp core install \
    --allow-root \
    --url="https:${DOMAIN_NAME}" \
    --title=${TITLE} \
    --admin_user=${WP_ADMIN_USER} \
    --admin_password=${WP_ADMIN_PASSWORD} \
    --admin_email=${WP_ADMIN_EMAIL}

    wp user create \
    --allow-root \
    ${WP_USER} \
    ${WP_USER_EMAIL} \
    --role=author \
    --user_pass=${WP_USER_PASSWORD}

fi
    echo "WordPress installation completed."

