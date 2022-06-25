-- DB 생성
CREATE DATABASE IF NOT EXISTS wordpress;
-- CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;

-- 일반 유저 계정 생성
CREATE user IF NOT EXISTS 'bahn'@'%' identified BY '0704';
GRANT all privileges ON wordpress.* TO 'bahn'@'%';
-- CREATE user IF NOT EXISTS '$MARIADB_USER'@'%' identified BY '$MARIADB_PASSWORD';
-- GRANT all privileges ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';

-- 관리자 계정 생성
CREATE user IF NOT EXISTS '42'@'%' identified BY '4242';
GRANT all privileges ON wordpress.* TO '42'@'%';
-- CREATE user IF NOT EXISTS '$MARIADB_ADMIN'@'%' identified BY '$MARIADB_ADMIN_PASSWORD';
-- GRANT all privileges ON $MARIADB_DATABASE.* TO '$MARIADB_ADMIN'@'%';

flush privileges;