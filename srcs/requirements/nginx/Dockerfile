FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
	    nginx \
		openssl

RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -sha256 \
	-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=bahn/CN=bahn" \
	-keyout /etc/ssl/private/inception_openssl.key \
	-out /etc/ssl/certs/inception_openssl.pem

COPY ./conf/ /etc/nginx/conf.d/

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]