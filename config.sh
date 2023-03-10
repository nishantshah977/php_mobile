#!/bin/bash

# Install Apache2 and PHP
apt update
apt install -y apache2 php

# Enable PHP module in Apache2
sed -i 's/#LoadModule php_module/LoadModule php_module/g' /etc/apache2/httpd.conf

# Change DocumentRoot to /storage/emulated/0/server
sed -i 's|DocumentRoot /data/data/com.termux/files/home|DocumentRoot /storage/emulated/0/server|g' /etc/apache2/httpd.conf

# Change Directory Index to index.php and index.html
sed -i 's|DirectoryIndex index.html|DirectoryIndex index.php index.html|g' /etc/apache2/httpd.conf


# Start Apache2
apachectl start

echo "Apache2 and PHP have been installed and configured successfully."
echo "You can access the server at http://localhost:8080/"
