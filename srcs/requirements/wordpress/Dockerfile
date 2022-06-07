FROM debian:buster

# RUN apt-get update && apt-get -y upgrade && apt-get -y install \
# 		wget \
# 		tar \
# 		php-fpm \
# 		apache2 \
# 		gnupg2 ca-certificates apt-transport-https software-properties-common
# 		# php \
# 		# libapache2-mod-php \
# 		# php-pear \
# 		# php-cgi \
# 		# php-common \
# 		# php-mbstring \
# 		# php-zip \
# 		# php-net-socket \
# 		# php-mysql \
# 		# php-bcmath \
# 		# php-gd \
# 		# php-xml-util \
# 		# php-gettext \
# 		# unzip \
# 		# git


RUN apt-get update && apt-get -y upgrade && apt-get -y install \
	vim \
	wget \
	php7.3-fpm \
	php-mysql \
	php-mbstring

# RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list \
# 	wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -

RUN wget https://wordpress.org/latest.tar.gz
RUN	tar -xvf latest.tar.gz
# RUN mv wordpress/ /var/www/html/
	# cp -p ./copy/wp-config.php /var/www/html/wordpress

COPY ./conf/wp-config.php /var/www/html/wordpress

EXPOSE 9000

# CMD [ "nginx", "-g", "daemon off;" ]