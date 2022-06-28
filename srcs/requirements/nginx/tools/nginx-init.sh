#!/bin/bash

set -e

openssl req -newkey rsa:4096 -days 365 -nodes -x509 -sha256	-subj "/C=KR/L=Seoul/ST=Seoul/O=42/OU=42Seoul/CN=bahn.42.fr" -keyout /etc/ssl/private/${PRIVATEKEY_NAME} -out /etc/ssl/certs/${CSR_NAME}

envsubst '${SERVER_NAME} ${PRIVATEKEY_NAME} ${CSR_NAME}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"