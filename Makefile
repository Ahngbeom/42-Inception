up :
	docker-compose -f srcs/docker-compose.yml up --build

down :
	docker-compose -f srcs/docker-compose.yml down

restart:
	docker-compose -f srcs/docker-compose.yml up --build --force-recreate --always-recreate-deps

re : clean up

clean:
	docker container prune --force
	docker image prune -a --force
	docker volume prune --force
	docker network prune --force

fclean: clean
	sudo rm -rf ~/data/mariadb_data/*
	sudo rm -rf ~/data/wordpress_data/*

ps :
	docker-compose -f srcs/docker-compose.yml ps

.PHONY : up down restart re clean fclean ps