# php_mobile
This repository install apache2 and php on termux and provide you some concepts on how to use apache2 on termux.

* Works on Termux
* Tested on Android 
# Create Your PHP web server on Termux 

**Copy and Paste On Termux**

```
termux-setup-storage && pkg install git && git clone https://github.com/nishantshah977/php_mobile && cd php_mobile && chmod +x config.sh && ./config.sh
```

**Your Directory will be "server" on your phone storage.**
<hr>
# Branch Info
This Branch will also install MariaDB in your system allowing to use SQL database.

# Using Apache2
* **apachectl start** - To start Apache2
* **apachectl stop** - To stop Apache2
* **apachectl restart** - To restart Apache2

# MariaDB Commands
* **mysqld_safe &** - Start MariaDB server
* **mysql** - To access MariaDB CLI
* **exit** - To exit MariaDB CLI

**Create Database Table**
```
CREATE DATABASE database_name;
```

**Create User to access Database**
```
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'localhost';
```
