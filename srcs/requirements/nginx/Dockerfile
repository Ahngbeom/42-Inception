FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
		curl \
	    nginx \
		openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -sha256 \
	-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=bahn/CN=bahn" \
	-keyout /etc/nginx/ssl/bahn_openssl_rsa4096.key \
	-out /etc/nginx/ssl/bahn_openssl_x509.pem
	# mv openssl_rsa4096.key etc/ssl/private/ \
	# mv openssl_x509.crt etc/ssl/certs/ \
	# chmod 600 etc/nginx/ssl/private/openssl_rsa4096.key etc/nginx/ssl/certs/openssl_x509.crt

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443

CMD [ "nginx", "-g", "daemon off;" ]