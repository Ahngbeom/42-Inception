FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
		mariadb-client \
		mariadb-server

COPY conf/my.cnf /etc/mysql/
COPY tools/ /var/tmp/

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chmod -R 777 /var/run/mysqld

RUN chmod +x /var/tmp/db-init.sh
ENTRYPOINT [ "/var/tmp/db-init.sh" ]

CMD [ "mysqld" ]
