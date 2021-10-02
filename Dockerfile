FROM debian:latest
MAINTAINER Vova Tkach <vladimirok5959@gmail.com>

ENV PHP_VERSION=7.4

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get install -y nginx && \
	apt-get install -y php7.4-fpm && \
	apt-get install -y php7.4-cgi && \
	apt-get install -y php7.4-gd && \
	apt-get install -y php7.4-zip && \
	apt-get install -y php7.4-curl && \
	apt-get install -y php7.4-mysql && \
	apt-get install -y php7.4-sqlite && \
	apt-get install -y php7.4-mbstring && \
	/etc/init.d/nginx stop && \
	/etc/init.d/php7.4-fpm stop && \
	rm /var/www/html/* && \
	echo "" >> /root/.profile && \
	echo "TIME_ZONE=\$(cat /etc/timezone)" >> /root/.profile && \
	echo "export TZ=\"\${TIME_ZONE}\"" >> /root/.profile && \
	echo "" >> /root/.bashrc && \
	echo "TIME_ZONE=\$(cat /etc/timezone)" >> /root/.bashrc && \
	echo "export TZ=\"\${TIME_ZONE}\"" >> /root/.bashrc

COPY --chown=root:root ./docker /
RUN chown www-data:www-data /var/www/html/index.php

CMD /start.sh
