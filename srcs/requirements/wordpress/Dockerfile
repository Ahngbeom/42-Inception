FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
	wget \
	curl \
	php \
	php-fpm \
	php-mysql 

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