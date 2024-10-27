FROM debian:buster

COPY . /app

EXPOSE 80 443

RUN sh /app/srcs/scripts/run_install.sh
RUN /etc/init.d/php7.3-fpm start

COPY ./srcs/wordpress /var/www/html/wordpress # I removed the wordpress directory as it took a lot of memory space. It would be more clean to automatically download it instead of storing it in this repository.
COPY ./srcs/phpmyadmin /var/www/html/phpmyadmin # I removed the phpmyadmin directory as it took a lot of memory space. It would be more clean to automatically download it instead of storing it in this repository.

# COPY ./srcs/index.html /var/www/html/index.html
# COPY ./srcs/back.jpg /var/www/html/back.jpg

COPY ./srcs/nginx/nginx.conf /etc/nginx
COPY ./srcs/nginx/html.conf /etc/nginx/sites-available

RUN ln -s /etc/nginx/sites-available/html.conf /etc/nginx/sites-enabled/
RUN sh /app/srcs/scripts/gen_certificate.sh
RUN chown -R www-data:www-data /var/www/html/*
RUN chmod -R 755 /var/www/html/*

CMD ["sh","/app/srcs/scripts/docker_entrypoint.sh"]
