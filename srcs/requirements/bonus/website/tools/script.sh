#!/bin/sh

mkdir -p /var/www/html/inception

cd /var/www/html/inception

cp /tools/index.html .
cp /tools/styles.css .

php -S 0.0.0.0:1337