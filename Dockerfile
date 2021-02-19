FROM		debian:buster

MAINTAINER	bahn <https://github.com/AhngBeom>

RUN		apt-get update && apt-get upgrade && apt-get -y install \
			nginx \
			curl \
			openssl \
			vim \
			mariadb-server \
			php-mysql \
			php-mbstring \
			wget \
			php7.3-fpm

EXPOSE		80 443

CMD		bash run.sh
