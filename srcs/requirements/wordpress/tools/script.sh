#!/bin/bash

sleep 5

mkdir -p /var/www/html
mkdir -p /run/php/
cd /var/www/html

# downloading the wp-cli - wordpress client: a command-line tool to interact with wordpress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# downloading the core files of wordpress in /var/www/html
wp core download --allow-root

# generating wp-config.php file
# wp-config.php contains the config for connecting with the database (MariaDB)
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

# setting up the wordpress website with the config provided in the arguments
wp core install --allow-root \
				--title=$WP_TITLE \
				--url=https://nazouz.42.fr \
				--admin_user=$WP_ADMIN_USER \
				--admin_password=$WP_ADMIN_PASS \
				--admin_email=$WP_ADMIN_EMAIL

# creates a new wordpress editor user
wp user create	--allow-root \
				$WP_USER $WP_USER_EMAIL \
				--role=editor --user_pass=$WP_PASS

wp plugin install redis-cache --activate --allow-root

wp redis enable --allow-root

# configuring the php-fpm to listen on port 9000 instead of using unix socket
sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/" /etc/php/7.4/fpm/pool.d/www.conf

# launching the php-fpm in the foreground
php-fpm7.4 -F
