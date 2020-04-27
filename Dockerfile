FROM debian:latest
MAINTAINER Vova Tkach <vladimirok5959@gmail.com>

ENV PHP_VERSION=7.3

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get install -y nginx && \
	apt-get install -y php7.3-fpm && \
	apt-get install -y php7.3-cgi && \
	apt-get install -y php7.3-gd && \
	apt-get install -y php7.3-mysql && \
	apt-get install -y php7.3-curl && \
	/etc/init.d/nginx stop && \
	/etc/init.d/php7.3-fpm stop && \
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
