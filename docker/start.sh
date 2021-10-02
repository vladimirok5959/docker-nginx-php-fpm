#!/bin/bash

# Set timezone
TIME_ZONE=$(cat /etc/timezone)
export TZ="${TIME_ZONE}"

# Env variables
/usr/bin/printenv > /var/www/.env

# PHP service
/etc/init.d/php7.4-fpm start

# Nginx
/usr/sbin/nginx
