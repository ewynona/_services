FROM    alpine:3.12

RUN     apk update && apk upgrade
RUN     apk add wget php php-fpm nginx openssl supervisor php-mysqli php-zip mariadb mariadb-client php-json

RUN     apk add vim

#wp
RUN     mkdir -p /var/www/
RUN     wget https://wordpress.org/wordpress-5.6.tar.gz
RUN     tar -xzvf wordpress-5.6.tar.gz -C /var/www/
RUN     rm wordpress-5.6.tar.gz
COPY    srcs/wp-config.php /var/www/wordpress/
RUN     chmod -R 755 /var/www/

#ssl
RUN     openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Russia/L=Kazan/O=21_school/OU=21_kazan/CN=ft_services" \
	    -newkey rsa:2048 -keyout /etc/ssl/key.key -out /etc/ssl/crt.crt
#nginx
COPY    srcs/default.conf /etc/nginx/conf.d/default.conf
RUN     mkdir /run/nginx

EXPOSE  5050

COPY    srcs/supervisord.conf /
CMD     /usr/bin/supervisord -c supervisord.conf