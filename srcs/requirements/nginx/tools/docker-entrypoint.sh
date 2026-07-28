#!/bin/sh

set -e

mkdir -p /etc/nginx/ssl

openssl req \
    -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/inception.key \
    -out /etc/nginx/ssl/inception.crt \
    -subj "/C=MA/ST=MS/L=BENGUERIR/O=42/OU=Inception/CN=$DOMAIN_NAME"

echo "Generated self-signed SSL/TLS certificate for $DOMAIN_NAME"

envsubst '$DOMAIN_NAME' \
    < /etc/nginx/nginx.conf > /etc/nginx/nginx.conf.tmp

mv /etc/nginx/nginx.conf.tmp /etc/nginx/nginx.conf

echo "Runing nginx ..."

exec "$@"