FROM    alpine:3.12

EXPOSE  8086

RUN     apk update && apk upgrade
RUN     apk add influxdb supervisor ca-certificates

RUN     apk add vim

COPY    srcs/sv.conf /sv.conf

RUN     wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN     wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk
RUN     apk add glibc-2.33-r0.apk

RUN     wget https://dl.influxdata.com/telegraf/releases/telegraf-1.18.0_linux_amd64.tar.gz
RUN     tar -zxvf telegraf-1.18.0_linux_amd64.tar.gz -C /
RUN     cp -r telegraf-1.18.0/* / && rm telegraf-1.18.0_linux_amd64.tar.gz

RUN     mkdir -p /etc/telegraf
RUN     telegraf --input-filter docker --output-filter influxdb config > /etc/telegraf/telegraf.conf

CMD     supervisord -c sv.conf