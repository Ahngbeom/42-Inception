#!/bin/sh

mysql_install_db

/etc/init.d/mysql start

#Check if the database exists

if [ -d "/var/lib/mysql/$MARIADB_DATABASE" ]
then 

	echo "Database already exists"
else

# Set root option so that connexion without root password is not possible

mysql_secure_installation <<_EOF_

Y
inception1234
inception1234
Y
n
Y
Y
_EOF_

#Add a root user on 127.0.0.1 to allow remote connexion

	echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

#Create database and user for wordpress
	echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE; GRANT ALL ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

#Import database
mysql -uroot -p$MARIADB_ROOT_PASSWORD $MARIADB_DATABASE < /var/tmp/wordpress.sql
mysql -u root -e "FLUSH PRIVILEGES;"
fi

/etc/init.d/mysql stop

exec "$@"