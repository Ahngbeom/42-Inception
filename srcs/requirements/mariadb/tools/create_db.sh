#!/bin/bash
set -e

## DB 생성
# mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE"

## 일반 유저 계정 생성
mysql -u root -e "CREATE user IF NOT EXISTS 'bahn'@'%' identified BY '1234'"
mysql -u root -e "GRANT all privileges ON wordpress.* TO 'bahn'@'%'"
# mysql -u root -e "CREATE user IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PASSWORD}'"
# mysql -u root -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%'"
# mysql -u root -e "FLUSH PRIVILEGES"

## 관리자 계정 생성
mysql -u root -e "CREATE user IF NOT EXISTS '42'@'%' identified BY '4242'"
mysql -u root -e "GRANT all privileges ON wordpress.* TO '42'@'%'"
# mysql -u root -e "CREATE user IF NOT EXISTS '${MARIADB_ADMIN}'@'%' IDENTIFIED BY '${MARIADB_ADMIN_PASSWORD}'"
# mysql -u root -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_ADMIN}'@'%'"
# mysql -u root -e "FLUSH PRIVILEGES"

exec "$@"
