FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client

COPY srcs/start.sh .
COPY srcs/my.cnf /etc/my.cnf

EXPOSE 3306

CMD sh start.sh