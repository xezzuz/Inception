#!/bin/bash

curl -L -o /var/www/html/adminer.php https://www.adminer.org/latest.php

cd /var/www/html

rm -rf index.html

php -S 0.0.0.0:9001