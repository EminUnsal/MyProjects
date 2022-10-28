#! /bin/bash

yum update -y
yum install httpd -y   
FOLDER='https://raw.githubusercontent.com/EminUnsal/MyProjects/main/aws/Project-003-kittens-carousel-static-website-ec2/static-web'
cd /var/www/html
wget $FOLDER/index.html  # yum install wget
wget $FOLDER/cat0.jpg
wget $FOLDER/cat1.jpg
wget $FOLDER/cat2.jpg
wget $FOLDER/cat3.png
systemctl start httpd
systemctl enable httpd