FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
		mariadb-server

COPY conf/ /etc/mysql/
COPY tools/ /var/tmp/

RUN chmod +x /var/tmp/db-init.sh
ENTRYPOINT [ "/var/tmp/db-init.sh" ]

CMD [ "mysqld_safe" ]
