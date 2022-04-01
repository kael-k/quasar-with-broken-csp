#!/bin/sh

NGINX_CONF_PATH="/etc/nginx/nginx.conf"
nginx -c "$NGINX_CONF_PATH" -g "daemon off;"
