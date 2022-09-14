FROM alpine:3.6

#general
RUN apk update && apk upgrade
RUN apk add vsftpd openssl openrc

#ssl
RUN     openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Russia/L=Kazan/O=21_school/OU=21_kazan/CN=ft_services" \
	    -newkey rsa:2048 -keyout /etc/ssl/key.key -out /etc/ssl/crt.crt
#vsftpd
COPY    srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

#usr
RUN     echo "root:root" | chpasswd

EXPOSE 21

CMD     vsftpd /etc/vsftpd/vsftpd.conf