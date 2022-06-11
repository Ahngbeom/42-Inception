up :
# docker run -it --name nginx_container -p 443:443 nginx
	docker-compose -f srcs/docker-compose.yml up -d --build

down :
# docker-compose -f srcs/docker-compose.yml down
	docker-compose -f srcs/docker-compose.yml down --rmi all

restart :
	docker-compose -f srcs/docker-compose.yml restart

re-build : down up

ps :
	docker-compose -f srcs/docker-compose.yml ps

.PHONY : up down restart re-build ps