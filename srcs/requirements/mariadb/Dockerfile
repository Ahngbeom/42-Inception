FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
		# mariadb-client \
		mariadb-server \
		wget

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64
RUN chmod +x /usr/local/bin/dumb-init

COPY conf/ /etc/mysql/
COPY tools/ /var/tmp/

RUN chmod +x /var/tmp/db-init.sh
# ENTRYPOINT [ "/var/tmp/db-init.sh" ]
ENTRYPOINT [ "/usr/local/bin/dumb-init", "--" ]

CMD [ "/var/tmp/db-init.sh" ]
