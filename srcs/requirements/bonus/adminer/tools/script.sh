#!/bin/bash

curl -O /var/www/html/adminer/adminer.php http://www.adminer.org/latest.php

curl -O /var/www/html/adminer/adminer.css https://raw.githubusercontent.com/vrana/adminer/master/designs/dracula/adminer.css

chown -R www-data:www-data /var/www/html/adminer.php

chmod 755 /var/www/html/adminer.php

cd /var/www/html

rm -rf index.html

php -S 0.0.0.0:9001