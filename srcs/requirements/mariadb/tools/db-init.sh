#!/bin/sh
set -e

mysql --version

service mysql start

if [ ! -d "/var/lib/mysql/$MARIADB_DATABASE" ]; then 
	eval "echo \"$(cat /var/tmp/query.sql)\"" | mariadb
fi

service mysql stop

mysqld_safe

exec "$@"
