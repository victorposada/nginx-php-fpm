FROM nginx:1.25

WORKDIR /usr/share/nginx

RUN apt-get update -y
RUN apt-get install -y php8.2 php 8.2-fpm php8.2-curl

COPY config/nginx /etc/nginx
COPY config/php /etc/php/8.2
COPY src /usr/share/nginx/html

EXPOSE 80

CMD ["/bin/bash", "-c", "php-fpm8.2 && chmod 777 /var/run/php/php8.2-fpm.sock && nginx -g 'daemon off;'"]

