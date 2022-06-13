-- 관리자
create user IF NOT EXISTS '42'@'%' identified by '42';
grant all privileges on wordpress.* to '42'@'%';
flush privileges;

-- 
CREATE DATABASE IF NOT EXISTS wordpress;
create user IF NOT EXISTS 'bahn'@'%' identified by '1234';
grant all privileges on wordpress.* to 'bahn'@'%';
flush privileges;