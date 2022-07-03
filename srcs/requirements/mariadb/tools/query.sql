------------------------------------------
-- MariaDB Initialization for WordPress --
------------------------------------------

-- DB 생성
CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;

-- 일반 계정 생성
CREATE USER IF NOT EXISTS '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_PASSWORD';
CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';

-- 관리자 계정 생성
CREATE USER IF NOT EXISTS '$MARIADB_ADMIN'@'localhost' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD';
CREATE USER IF NOT EXISTS '$MARIADB_ADMIN'@'%' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD';

-- 계정 추가에 대한 변경사항 적용, 반영
FLUSH PRIVILEGES;

-- 일반 계정의 DB 접근 권한 부여
GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_PASSWORD';
GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';

-- 관리자 계정의 DB 접근 권한 부여
GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_ADMIN'@'localhost' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_ADMIN'@'%' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD' WITH GRANT OPTION;

-- root 계정 플러그인 변경 (unix_socket -> mysql_native_password) 및 비밀번호 설정
ALTER USER root@localhost IDENTIFIED VIA mysql_native_password;
SET PASSWORD = PASSWORD('$MARIADB_ROOT_PASSWORD');

-- Database 목록 조회
SHOW DATABASES;

-- wordpress 데이터베이스 선택 및 wordpress 데이터베이스 안의 테이블 목록 조회
USE $MARIADB_DATABASE; SHOW TABLES;

-- mysql 데이터베이스의 user 테이블 컬럼 조회
SELECT user, host, password, authentication_string, plugin FROM mysql.user;
