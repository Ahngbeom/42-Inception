CREATE DATABASE IF NOT EXISTS wordpress;
create user IF NOT EXISTS 'bahn'@'%' identified by '1234';
grant all privileges on wordpress.* to 'bahn'@'%';
flush privileges;