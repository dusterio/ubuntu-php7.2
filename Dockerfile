FROM ubuntu:18.04
MAINTAINER Denis Mysenko <denis@mysenko.com>

RUN apt-get -y update
RUN echo "Australia/Sydney" > /etc/timezone
RUN apt-get -y install tzdata
RUN dpkg-reconfigure -f noninteractive tzdata
RUN apt-get install -y --allow-unauthenticated nginx-full
RUN apt-get install -y net-tools nano telnet
RUN apt-get install -y php7.2-fpm php7.2-intl php7.2-curl php7.2-mbstring php7.2-mysqli php7.2-xml

ADD start.sh /
ADD nginx_site.conf /etc/nginx/sites-enabled/default
ADD fpm.conf /etc/php/7.2/fpm/pool.d/www.conf

ENTRYPOINT ["/bin/sh", "/start.sh"]
