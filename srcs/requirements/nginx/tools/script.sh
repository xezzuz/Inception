#!/bin/bash

echo nginx-script

chown -R www-data:www-data /var/www/html

openssl req -x509 -nodes \
		-keyout /etc/ssl/private/nazouz.42.fr.key \
		-out /etc/ssl/certs/nazouz.42.fr.crt \
		-subj "/C=MA/ST=BM/L=KH/O=42/OU=student/CN=nazouz.42.fr"

nginx -g "daemon off;"