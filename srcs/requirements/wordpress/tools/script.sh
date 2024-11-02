#!/bin/bash

sleep 5
mkdir -p /var/www/html
mkdir -p /run/php/
cd /var/www/html


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp


wp core download --allow-root

wp config create	--allow-root \
					--dbname=$DB_NAME \
					--dbuser=$USR_NAME \
					--dbpass=$USR_PASS \
					--dbhost=$DB_HOST \
					--extra-php<<PHP
define('WP_CACHE', true);
define('WP_REDIS_HOST', 'redis-container');
define('WP_REDIS_PORT', 6379);
PHP

wp core install --allow-root \
				--title=$WP_TITLE \
				--url=https://nazouz.42.fr \
				--admin_user=$WP_ADMIN_USER \
				--admin_password=$WP_ADMIN_PASS \
				--admin_email=$WP_ADMIN_EMAIL

wp user create	--allow-root \
				$WP_USER $WP_USER_EMAIL \
				--role=editor --user_pass=$WP_PASS

wp plugin install redis-cache --activate --allow-root

wp redis enable --allow-root

sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/" /etc/php/7.4/fpm/pool.d/www.conf

php-fpm7.4 -F
