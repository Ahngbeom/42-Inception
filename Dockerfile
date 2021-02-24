FROM debian:buster

MAINTAINER bahn <https://github.com/AhngBeom>

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
	    nginx \
	    curl \
	    openssl \
	    mariadb-server \
	    php-mysql \
	    php-mbstring \
	    wget \
	    php7.3-fpm

COPY ./srcs/initialize.sh /copy/
COPY ./srcs/default /copy/
COPY ./srcs/wp-config.php /copy/
COPY ./srcs/config.inc.php /copy/

EXPOSE 80 443

CMD bash ./copy/initialize.sh
