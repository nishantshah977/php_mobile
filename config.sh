#!/bin/bash

# Install Apache2 and PHP
pkg update
pkg install apache2
pkg install php-apache
pkg install mariadb

cd /storage/emulated/0/
mkdir server
cd $HOME


# Enable PHP module in Apache2
echo "ServerName localhost" >> $PREFIX/etc/apache2/httpd.conf
echo "LoadModule php_module /data/data/com.termux/files/usr/libexec/apache2/libphp.so" >> $PREFIX/etc/apache2/httpd.conf
echo "<FilesMatch \.php$>
  SetHandler application/x-httpd-php
</FilesMatch>" >> $PREFIX/etc/apache2/httpd.conf

# Change DocumentRoot to /storage/emulated/0/server
sed -i 's|DocumentRoot "/data/data/com.termux/files/usr/share/apache2/default-site/htdocs"|DocumentRoot "/storage/emulated/0/server"|g' $PREFIX/etc/apache2/httpd.conf

sed -i 's|<Directory "/data/data/com.termux/files/usr/share/apache2/default-site/htdocs">|<Directory "/storage/emulated/0/server">|g' $PREFIX/etc/apache2/httpd.conf
# Change Directory Index to index.html index.php
sed -i 's|DirectoryIndex index.html|DirectoryIndex index.html index.php|g' $PREFIX/etc/apache2/httpd.conf

sed -i 's|LoadModule mpm_worker_module libexec/apache2/mod_mpm_worker.so|#LoadModule mpm_worker_module libexec/apache2/mod_mpm_worker.so|g' $PREFIX/etc/apache2/httpd.conf

sed -i 's|#LoadModule mpm_prefork_module libexec/apache2/mod_mpm_prefork.so|LoadModule mpm_prefork_module libexec/apache2/mod_mpm_prefork.so|g' $PREFIX/etc/apache2/httpd.conf


# Start Apache2
apachectl start

echo "Apache2 and PHP have been installed and configured successfully."
echo "Server Running on http://localhost:8080"
