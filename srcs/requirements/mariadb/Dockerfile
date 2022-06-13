FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
		# sudo \
		# mariadb-client \
		mariadb-server

EXPOSE 3306

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/create_db.sql /var/www/

# RUN mysql -V
RUN service mysql start && mysql < /var/www/create_db.sql
# RUN service mariadb start 
# RUN chown -R mysql:mysql /var/lib/mysql
# RUN chmod -R 700 /var/lib/mysql
# RUN chmod 777 /run/mysqld/mysqld.sock


CMD [ "mysqld" ]
