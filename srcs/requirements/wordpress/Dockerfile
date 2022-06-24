FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
	wget \
	curl \
	php \
	php-fpm \
	php-mysql 

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

RUN mkdir -p /run/php/ && touch /run/php/php7.3-fpm.pid

##### Reference: https://wp-cli.org/#installing
RUN curl -kO --retry 3 https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
RUN chmod +x wp-cli.phar; 
RUN mv wp-cli.phar /usr/local/bin/wp;

RUN chmod +x /var/temp/wp-init.sh
ENTRYPOINT [ "/var/temp/wp-init.sh" ]

CMD ["php-fpm7.3", "--nodaemonize"]