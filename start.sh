#!/bin/bash

# Launch PHP
/etc/init.d/php7.2-fpm start

# Launch NGINX
#/etc/init.d/nginx start
/usr/sbin/nginx -g 'daemon off;'

