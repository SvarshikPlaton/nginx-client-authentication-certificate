#/bin/bash

chmod 500 /etc/nginx/ssl/
chown -R nginx:  /etc/nginx/ssl/

chmod 500 /etc/nginx/ssl/certs
chmod 400 /etc/nginx/ssl/certs*

systemctl restart nginx