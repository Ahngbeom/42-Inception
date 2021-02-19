#!/bin/bash

# 쉘 스크립트 파일 실행 권한 추가
chmod +x ./run.sh

# OpenSSL 개인 키 & 인증서 생성 및 이동, 권한 변경
openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Lee/CN=localhost" -keyout localhost.dev.key -out localhost.dev.crt
mv localhost.dev.crt etc/ssl/certs/
mv localhost.dev.key etc/ssl/private/
chmod 600 etc/ssl/certs/localhost.dev.crt etc/ssl/private/localhost.dev.key

# Dockerfile에 의해 복사된 default 파일을 nginx 웹 서버에 적용
cp -p ./srcs/default /etc/nginx/sites-available/

# 워드프레스 구축
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress/ var/www/html/
chown -R www-data:www-data /var/www/html/wordpress
cp p ./srcs/wp-config.php /var/www/html/wordpress

# mysql 구문을 통해 워드프레스 DB 생성
service mysql start
echo "CREATE DATABASE IF NOT EXISTS wordpress;"
echo "CREATE USER IF NOT EXISTS 'bahn'@'localhost' IDENTIFIED BY '1234';"
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'bahn'@'localhost' WITH GRANT OPTION;"
echo "USE wordpress;"

# phpMyAdmin 구축 
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
mv phpmyadmin /var/www/html/
cp -p ./srcs/config.inc.php /var/www/html/phpmyadmin/	# blowfish 암호가 삽입된 srcs/config.inc.php 파일을 복사

service nginx start
service php7.3-fpm start
service mysql restart

