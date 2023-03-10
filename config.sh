#!/data/data/com.termux/files/usr/bin/bash

pkg install -y apache2 php
apachectl start
sed -i 's/#LoadModule php7_module/LoadModule php7_module/g' $PREFIX/etc/apache2/httpd.conf
apachectl restart
echo "<?php phpinfo(); ?>" > $PREFIX/share/apache2/default-site/htdocs/info.php

echo "Apache2 and PHP have been installed and configured successfully."
echo "You can access the PHP information page by opening a web browser on your Android device and navigating to http://localhost/info.php."
