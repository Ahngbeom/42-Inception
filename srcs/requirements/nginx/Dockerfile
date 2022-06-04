FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
		curl \
	    nginx \
		openssl

# COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]