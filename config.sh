#!/bin/bash

# Install Apache2 and PHP
pkg update
pkg install -y apache2 php

# Enable PHP module in Apache2
echo "
LoadModule php_module libexec/apache2/libphp.so" >> $PREFIX/etc/apache2/httpd.conf

# Change DocumentRoot to /storage/emulated/0/server
sed -i 's|DocumentRoot "/data/data/com.termux/files/usr/share/apache2/default-site/htdocs"|DocumentRoot "/storage/emulated/0/server"|g' $PREFIX/etc/apache2/httpd.conf

# Change Directory Index to index.html index.php
sed -i 's|DirectoryIndex index.html|DirectoryIndex index.html index.php|g' $PREFIX/etc/apache2/httpd.conf

# Start Apache2
apachectl start

echo "Apache2 and PHP have been installed and configured successfully."
