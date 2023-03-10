#!/bin/bash

# Install Apache2 and PHP
pkg update
pkg install -y apache2 php

# Enable PHP module in Apache2
echo "ServerName localhost" >> $PREFIX/etc/apache2/httpd.conf
echo "LoadModule php7_module /data/data/com.termux/files/usr/libexec/apache2/libphp7.so" >> $PREFIX/etc/apache2/httpd.conf
echo "<FilesMatch \.php$>
  SetHandler application/x-httpd-php
</FilesMatch>"

# Change DocumentRoot to /storage/emulated/0/server
sed -i 's|DocumentRoot "/data/data/com.termux/files/usr/share/apache2/default-site/htdocs"|DocumentRoot "/storage/emulated/0/server"|g' $PREFIX/etc/apache2/httpd.conf

# Change Directory Index to index.html index.php
sed -i 's|DirectoryIndex index.html|DirectoryIndex index.html index.php|g' $PREFIX/etc/apache2/httpd.conf

# Start Apache2
apachectl start

echo "Apache2 and PHP have been installed and configured successfully."
