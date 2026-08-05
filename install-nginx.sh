#!/bin/bash
set -e

apt-get update -y
apt install nginx -y

systemctl enable nginx
systemctl start nginx

echo "<h1>Welcome to nginx, made by PG during terraform practice</h1>" > /var/www/html/index.html