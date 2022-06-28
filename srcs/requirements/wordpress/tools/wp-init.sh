#!/bin/bash
set -e

# sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g" /etc/php/7.3/fpm/pool.d/www.conf

### /var/www/html/wp-config.php이 존재하지않거나 정규 파일이 아닐 경우
if [ ! -f /var/www/html/wp-config.php ]; then

	### Check wp info
	wp --info

	### Korean Language WordPress. 한글판 워드프레스 구성파일들을 현재 디렉토리에 다운로드
	cd /var/www/html && wp core download --allow-root;

	### wp-config-sample.php 샘플 파일 복사
	cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
	
	### sed -i : 찾은 문자열 위에 다른 문자열로 대체
	### 모든 라인에 존재하는 "username_here" 문자열 위에 $WORDPRESS_DB_USER 환경 변수 값으로 대체
	sed -i "s/username_here/$MARIADB_USER/g" /var/www/html/wp-config.php
	sed -i "s/password_here/$MARIADB_PASSWORD/g" /var/www/html/wp-config.php
	sed -i "s/localhost/$MARIADB_HOST/g" /var/www/html/wp-config.php
	sed -i "s/database_name_here/$MARIADB_DATABASE/g" /var/www/html/wp-config.php

	### wordpress core install & set admin
	wp core install --allow-root --url=${DOMAIN_NAME} --title=Inception --admin_user=${MARIADB_ADMIN} --admin_password=${MARIADB_ADMIN_PASSWORD} --admin_email=${MARIADB_ADMIN_EMAIL}
	
	### wordpress user create & set user
	wp user create --allow-root ${MARIADB_USER} ${MARIADB_EMAIL} --user_pass=${MARIADB_PASSWORD}

	### get wordpress user list
	wp user list --allow-root;

	### wordpress theme install & activate
	wp theme install twentytwenty --allow-root --activate;

	### wordpress korean language install & activate
	wp language core install --allow-root ko_KR;
	### *** VM VirtualBox에서 구동시켰을 때, FireFox 브라우저에서 한글이 깨지는 현상이 발생한다.
	# wp language core activate --allow-root ko_KR;

fi

exec "$@"