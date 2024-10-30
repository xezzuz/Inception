#!/bin/bash

sleep 5

mkdir -p /var/www/html
mkdir -p /run/php/

# change working directory to default wordpress webpages
cd /var/www/html

# clean all the existing files
rm -rf *

# downloading the wp-cli - wordpress client: a command-line tool to interact with wordpress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

# making it accessible through the command line by running wp
mv wp-cli.phar /usr/local/bin/wp

# creating wp-cli cache directory
mkdir -p /var/www/.wp-cli/cache/

# changing ownership of the cache directory to the user:group www-data:www-data
# the webserver typically performs under the user www-data
# so changing the ownership is crucial to let the NGINX server perfoms without problems
chown -R www-data:www-data /var/www/.wp-cli/cache/

# changing ownership of the webpages directory to the user:group www-data:www-data
chown -R www-data:www-data .

# changing permissions of the webpages directory
# owner can read, write, execute
# others can only read those files (NGINX)
chmod -R 755 .

# downloading the core files of wordpress in /var/www/html
sudo -u www-data wp core download

# generating wp-config.php file
# wp-config.php contains the config for connecting with the database (MariaDB)
sudo -u www-data wp config create \
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
sudo -u www-data wp core install \
				--title=$WP_TITLE \
				--url=https://nazouz.42.fr \
				--admin_user=$WP_ADMIN_USER \
				--admin_password=$WP_ADMIN_PASS \
				--admin_email=$WP_ADMIN_EMAIL

# creates a new wordpress editor user
sudo -u www-data wp user create $WP_USER $WP_USER_EMAIL \
								--role=editor --user_pass=$WP_PASS

sudo -u www-data wp plugin install redis-cache --activate

sudo -u www-data wp redis enable

# configuring the php-fpm to listen on port 9000 instead of using unix socket
sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf

# launching the php-fpm in the foreground
php-fpm7.4 -F
