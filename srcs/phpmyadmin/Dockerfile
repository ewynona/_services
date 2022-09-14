FROM    alpine:3.12

RUN     apk update && apk upgrade
RUN     apk add wget openssl supervisor nginx
RUN     apk add php php-fpm php-json php-mysqli php-json php-xml php-iconv phpmyadmin php-mbstring php-gettext
RUN     apk add vim

#ssl
RUN     openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Russia/L=Kazan/O=21_school/OU=21_kazan/CN=ft_services" \
	    -newkey rsa:2048 -keyout /etc/ssl/key.key -out /etc/ssl/crt.crt
#nginx
COPY    srcs/nginx.conf /etc/nginx/conf.d/default.conf
RUN     mkdir /run/nginx

#pma
RUN     wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz
RUN     tar -xzvf phpMyAdmin-5.1.0-all-languages.tar.gz
RUN     mv phpMyAdmin-5.1.0-all-languages /var/www/phpmyadmin
RUN     rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz
COPY    srcs/config.inc.php /var/www/phpmyadmin/config.inc.php

EXPOSE  5000

RUN     mkdir -p /var/www/phpmyadmin/tmp/
RUN     chmod 777 -R /var/www/phpmyadmin/tmp/
COPY    srcs/supervisord.conf /
CMD /usr/bin/supervisord -c supervisord.conf