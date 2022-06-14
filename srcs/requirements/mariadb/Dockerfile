FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
		mariadb-server

EXPOSE 3306

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
# COPY conf/my.cnf /etc/mysql/
COPY tools/create_db.sql /var/www/

RUN service mysql start && mysql < /var/www/create_db.sql
# RUN ["/bin/bash", "-c", "service mysql start && mysql < /var/www/create_db.sql"]
# RUN ["/bin/bash", "-c", "mysql < /var/www/create_db.sql"]

CMD [ "mysqld" ]
