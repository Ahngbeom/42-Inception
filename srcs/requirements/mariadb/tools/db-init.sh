#!/bin/sh
set -e

mysql --version

if [ ! -d "/var/lib/mysql/$MARIADB_DATABASE" ]; then 
	service mysql start
	eval "echo \"$(cat /var/tmp/query.sql)\"" | mysql
	service mysql stop
fi

mysqld_safe

exec "$@"
