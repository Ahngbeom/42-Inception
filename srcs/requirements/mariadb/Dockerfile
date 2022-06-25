FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
		mariadb-server

COPY conf/my.cnf /etc/mysql/
COPY tools/ /var/tmp/

RUN service mysql start && mysql < /var/tmp/db-init.sql
# RUN service mysql start && bash /var/tmp/db-init.sh

CMD [ "mysqld" ]
