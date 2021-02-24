#!/bin/bash

chmod +x ./copy/initialize.sh

openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=bahn/CN=localhost" -keyout openssl_rsa4096.key -out openssl_x509.crt
mv openssl_rsa4096.key etc/ssl/private/
mv openssl_x509.crt etc/ssl/certs/
chmod 600 etc/ssl/private/openssl_rsa4096.key etc/ssl/certs/openssl_x509.crt

cp -p ./copy/default /etc/nginx/sites-available/

wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress/ /var/www/html/
cp -p ./copy/wp-config.php /var/www/html/wordpress

service mysql start
echo "CREATE DATABASE IF NOT EXISTS wordpress;"	| mysql -u root
echo "CREATE USER IF NOT EXISTS 'bahn'@'localhost' IDENTIFIED BY '1234';"  | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'bahn'@'localhost' WITH GRANT OPTION;" | mysql -u root

wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
mv phpmyadmin /var/www/html/
cp -p ./copy/config.inc.php /var/www/html/phpmyadmin/

chown -R www-data:www-data /var/www/
chmod -R +x /var/www/

service nginx start
service php7.3-fpm start
service mysql restart

bash
