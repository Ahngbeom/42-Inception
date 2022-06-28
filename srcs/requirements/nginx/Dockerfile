FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
	    nginx \
		openssl \
		gettext-base

# COPY ./conf/default.conf /etc/nginx/conf.d/
COPY ./conf/default.conf.template /etc/nginx/conf.d/
COPY ./tools /var/temp/

RUN chmod +x /var/temp/nginx-init.sh
ENTRYPOINT [ "/var/temp/nginx-init.sh" ]

CMD [ "nginx", "-g", "daemon off;" ]