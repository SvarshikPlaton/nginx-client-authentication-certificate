#/bin/bash

yum update -y --exclude=kernel*

yum install -y nginx
systemctl enable nginx
systemctl start nginx

mkdir /html
yum install -y policycoreutils-python-utils
semanage fcontext -a -t httpd_sys_content_t "/html(/.*)?"
restorecon -Rv /html

firewall-cmd --permanent --zone=public --add-port=443/tcp
firewall-cmd --reload
semanage port -a -t http_port_t -p tcp 443

mkdir -p /etc/nginx/ssl/certs
chmod 777 /etc/nginx/ssl/certs

# index.html
echo "<html>
<head><title>Welcome to nginx!</title></head>
<body>
<h1>Hello from Nginx</h1>
</body>
</html>" > /html/index.html

echo "server {
    listen 443 ssl;
    server_name localhost;

    ssl_certificate /etc/nginx/ssl/certs/ca.crt;
    ssl_certificate_key /etc/nginx/ssl/certs/ca.key;
    ssl_client_certificate /etc/nginx/ssl/certs/ca.crt;
    ssl_verify_client on;
    ssl_verify_depth 3;

    location / {
         root /html;
         index index.html;
    }
}" > /etc/nginx/conf.d/default.conf

