#!/bin/sh

service mysql start && mysql -u root < /app/srcs/scripts/wordpress_database.sql
service php7.3-fpm restart
service nginx restart
rm /var/www/html/index.nginx-debian.html
sleep infinity & wait
