#!/bin/sh
set -e

mysql --version

service mysql start

if [ ! -d "/var/lib/mysql/$MARIADB_DATABASE" ]; then 

# mysql -u root -e "DROP USER IF EXISTS root; CREATE OR REPLACE USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';"

# mysql -u root -e "SHOW DATABASES;"
# mysql -u root -e "use mysql; SELECT user,authentication_string,plugin,host FROM mysql.user;"
# mysql -u root -e "use mysql; update user set plugin='mysql_native_password' where user='root'; FLUSH PRIVILEGES;";
# mysql -u root -e "use mysql; SELECT user,authentication_string,plugin,host FROM mysql.user;"
# mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MARIADB_ROOT_PASSWORD');"
# mysql -u root -e "FLUSH PRIVILEGES;"
# mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MARIADB_ROOT_PASSWORD';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '1234' WITH GRANT OPTION;"
# mysql -u root -e "FLUSH PRIVILEGES;"


# # ## DB 생성
# mysql -u root -p $MARIADB_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"

# ## 일반 계정 생성
# mysql -u root -p $MARIADB_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_PASSWORD';"
# mysql -u root -p $MARIADB_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"

# ## 관리자 계정 생성
# mysql -u root -p $MARIADB_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$MARIADB_ADMIN'@'localhost' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD';"
# mysql -u root -p $MARIADB_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$MARIADB_ADMIN'@'%' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD';"

# ## 계정 추가에 대한 변경사항 적용, 반영
# mysql -u root -p $MARIADB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

# ## 일반 계정의 DB 접근 권한 부여
# mysql -u root -p $MARIADB_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_PASSWORD';"
# mysql -u root -p $MARIADB_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"

# ## 관리자 계정의 DB 접근 권한 부여
# mysql -u root -p $MARIADB_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_ADMIN'@'localhost' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD' WITH GRANT OPTION;"
# mysql -u root -p $MARIADB_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_ADMIN'@'%' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD' WITH GRANT OPTION;"

# ## DB 생성
# mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"

# ## 일반 계정 생성
# mysql -u root -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_PASSWORD';"
# mysql -u root -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"

# ## 관리자 계정 생성
# mysql -u root -e "CREATE USER IF NOT EXISTS '$MARIADB_ADMIN'@'localhost' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD';"
# mysql -u root -e "CREATE USER IF NOT EXISTS '$MARIADB_ADMIN'@'%' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD';"

# ## 계정 추가에 대한 변경사항 적용, 반영
# mysql -u root -e "FLUSH PRIVILEGES;"

# ## 일반 계정의 DB 접근 권한 부여
# mysql -u root -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_PASSWORD';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"

# ## 관리자 계정의 DB 접근 권한 부여
# mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_ADMIN'@'localhost' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD' WITH GRANT OPTION;"
# mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_ADMIN'@'%' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD' WITH GRANT OPTION;"

eval "echo \"$(cat //var/tmp/query.sql)\"" | mariadb
fi

service mysql stop

exec "$@"
