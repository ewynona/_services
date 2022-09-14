#!/bin/sh

/usr/bin/mysql_install_db
chmod 777 -R /var/lib/mysql/
/usr/share/mariadb/mysql.server start

mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%';"
mysql -e "FLUSH PRIVILEGES;"
/usr/share/mariadb/mysql.server stop

#sh
/usr/bin/mysqld_safe