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
	# vim \
	wget \
	curl \
	php \
	php-fpm \
	php-mysql \
	php-mbstring

# RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list \
# 	wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -

# RUN wget https://wordpress.org/latest.tar.gz
# RUN	tar -xvf latest.tar.gz
# RUN mv wordpress/ /var/www/html/
	# cp -p ./copy/wp-config.php /var/www/html/wordpress

# RUN echo "Wordpress: Add Korean Language..."
# RUN wget https://ko.wordpress.org/wordpress-6.0-ko_KR.tar.gz
# RUN tar -xzf wordpress-6.0-ko_KR.tar.gz
# RUN mv -f wordpress /var/www/html
# RUN rm -rf wordpress-6.0-ko_KR.tar.gz

COPY ./conf /etc/php/7.3/fpm/pool.d/
COPY ./tools /var/temp/

EXPOSE 9000

# Reference: https://wp-cli.org/#installing
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
RUN curl -kO --retry 3 https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
RUN chmod +x wp-cli.phar; 
RUN mv wp-cli.phar /usr/local/bin/wp;

RUN chmod +x /var/temp/wp-init.sh

ENTRYPOINT [ "/var/temp/wp-init.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]