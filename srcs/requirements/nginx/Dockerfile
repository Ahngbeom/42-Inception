FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
	    nginx \
		openssl

RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -sha256 \
	-subj "/C=KR/L=Seoul/ST=Seoul/O=42/OU=42Seoul/CN=bahn.42.fr" \
	-keyout /etc/ssl/private/inception_PRIVATE_KEY.key \
	-out /etc/ssl/certs/inception_CSR.csr

COPY ./conf/ /etc/nginx/conf.d/

CMD [ "nginx", "-g", "daemon off;" ]