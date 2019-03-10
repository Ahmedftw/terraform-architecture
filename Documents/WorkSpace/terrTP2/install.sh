#!/bin/bash
sudo yum update -y
sudo yum install httpd
service httpd start
chkconfig httpd on
echo "<html><h1>Hello ^^</h2></html>" > /var/www/html/index.html