#!/bin/bash
set -e

mysql --version

service mysql start

# mysql -u root -e "alter user 'root'@'localhost' identified with mysql_native_password by 'pw123';"
mysql -u root -e "SET PASSWORD FOR 'root'@localhost = PASSWORD('1234');"

## DB 생성
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"

## 일반 계정 생성
mysql -u root -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_PASSWORD';"
mysql -u root -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"

## 관리자 계정 생성
mysql -u root -e "CREATE USER IF NOT EXISTS '$MARIADB_ADMIN'@'localhost' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD';"
mysql -u root -e "CREATE USER IF NOT EXISTS '$MARIADB_ADMIN'@'%' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD';"

## 계정 추가에 대한 변경사항 적용, 반영
mysql -u root -e "FLUSH PRIVILEGES;"

## 일반 계정의 DB 접근 권한 부여
mysql -u root -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_PASSWORD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"

## 관리자 계정의 DB 접근 권한 부여
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_ADMIN'@'localhost' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD' WITH GRANT OPTION;"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_ADMIN'@'%' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD' WITH GRANT OPTION;"

service mysql stop

exec "$@"
