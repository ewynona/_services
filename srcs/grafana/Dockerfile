FROM alpine:3.12

EXPOSE 3000

RUN apk update && apk upgrade
RUN apk add wget ca-certificates

RUN wget -q https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.5.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-7.3.5.linux-amd64.tar.gz -C /
RUN rm grafana-enterprise-7.3.5.linux-amd64.tar.gz

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk
RUN apk add glibc-2.33-r0.apk

WORKDIR /grafana-7.3.5/bin

COPY srcs/grafana.db /grafana-7.3.5/data/grafana.db

CMD ./grafana-server
