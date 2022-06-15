#!/bin/bash
set -e

	# sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
	chown -R www-data:www-data /var/www/*;
	chown -R 755 /var/www/*;
	mkdir -p /run/php/;
	touch /run/php/php7.3-fpm.pid;

	mkdir -p /var/www/html
	
	# Check wp info
	wp --info

	# Korean Language WordPress
	cd /var/www/html && wp core download --allow-root --locale=ko_KR ;

	mv /var/temp/wp-config.php /var/www/html/
	
	# wp core install & set admin
	wp core install --allow-root --url=${DOMAIN_NAME} --title=Inception --admin_user=${WORDPRESS_DB_ADMIN} --admin_password=${WORDPRESS_DB_ADMIN_PASSWORD} --admin_email=${WORDPRESS_DB_ADMIN_EMAIL}
	# wp user create & set user
	wp user create --allow-root ${WORDPRESS_DB_USER} ${WORDPRESS_DB_EMAIL} --user_pass=${WORDPRESS_DB_PASSWORD};

exec "$@"