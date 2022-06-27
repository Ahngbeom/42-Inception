#!/bin/bash
set -e

# mysql_install_db

service mysql start

# /usr/bin/mysql_secure_installation

# mysql -u root -e "GRANT all ON *.* TO 'root'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD'; FLUSH PRIVILEGES;";

## DB 생성
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE; FLUSH PRIVILEGES;"

## 일반 유저 계정 생성
mysql -u root -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD'; FLUSH PRIVILEGES;"
mysql -u root -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%'; FLUSH PRIVILEGES;"

## 관리자 계정 생성
mysql -u root -e "CREATE USER IF NOT EXISTS '$MARIADB_ADMIN'@'%' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD'; FLUSH PRIVILEGES;"
mysql -u root -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_ADMIN'@'%'; FLUSH PRIVILEGES;"

service mysql stop

exec "$@"
