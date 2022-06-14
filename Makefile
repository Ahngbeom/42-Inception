up :
# docker run -it --name nginx_container -p 443:443 nginx
	docker-compose -f srcs/docker-compose.yml up --build

down :
# docker-compose -f srcs/docker-compose.yml down
	docker-compose -f srcs/docker-compose.yml down

restart:
	docker-compose -f srcs/docker-compose.yml up --build --force-recreate --always-recreate-deps

re : clean up

clean:
	docker container prune --force
# docker rm -f $(docker ps -aq)

# docker-compose -f srcs/docker-compose.yml down --rmi local
	docker image prune -a --force

	docker volume prune --force
	docker network prune --force

ps :
	docker-compose -f srcs/docker-compose.yml ps

.PHONY : up down restart re clean ps