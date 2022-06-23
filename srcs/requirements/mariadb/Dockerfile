FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
		mariadb-server

EXPOSE 3306

COPY conf/my.cnf /etc/mysql/
COPY tools/ /var/tmp/

RUN service mysql start && mysql < /var/tmp/create_db.sql
# RUN service mysql start && bash /var/tmp/create_db.sh

CMD [ "mysqld" ]
