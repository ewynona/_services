FROM alpine:3.12

#base install
RUN apk update && apk upgrade
RUN apk add nginx
RUN apk add openssl

#copy file
COPY ./srcs/default /etc/nginx/conf.d/default.conf
COPY srcs/start.sh ./

#openssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Russia/L=Kazan/O=21_school/OU=21_kazan/CN=ft_services" \
	-newkey rsa:2048 -keyout /etc/ssl/key.key -out /etc/ssl/crt.crt

RUN mkdir -p /run/nginx

EXPOSE 80 443

CMD sh start.sh