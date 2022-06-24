#!/bin/bash
set -e

	# listen = /run/php/php7.3-fpm.sock 패턴을 listen = 9000 으로 변경
	# sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
	# chown -R www-data:www-data /var/www/*;
	# chown -R 755 /var/www/*;
	# mkdir -p /run/php/ && touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then

	# Check wp info
	wp --info

	# Korean Language WordPress
	cd /var/www/html && wp core download --allow-root --locale=ko_KR ;

	# wp config create --allow-root --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST};
	cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
	
	# sed -i : 찾은 문자열 위에 다른 문자열로 대체
	# 모든 라인에 존재하는 "username_here" 문자열 위에 $WORDPRESS_DB_USER 환경 변수 값으로 대체
	sed -i "s/username_here/$WORDPRESS_DB_USER/g" /var/www/html/wp-config.php
	sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/g" /var/www/html/wp-config.php
	sed -i "s/localhost/$WORDPRESS_DB_HOST/g" /var/www/html/wp-config.php
	sed -i "s/database_name_here/$WORDPRESS_DB_NAME/g" /var/www/html/wp-config.php

	# wp core install & set admin
	wp core install --allow-root --url=${DOMAIN_NAME} --title=Inception --admin_user=${WORDPRESS_DB_ADMIN} --admin_password=${WORDPRESS_DB_ADMIN_PASSWORD} --admin_email=${WORDPRESS_DB_ADMIN_EMAIL}
	
	# wp user create & set user
	wp user create --allow-root ${WORDPRESS_DB_USER} ${WORDPRESS_DB_EMAIL} --user_pass=${WORDPRESS_DB_PASSWORD}

fi

exec "$@"