up:
	docker-compose -f srcs/docker-compose.yml up --build

stop:
	docker-compose -f srcs/docker-compose.yml stop

down:
	docker-compose -f srcs/docker-compose.yml down

restart:
	docker-compose -f srcs/docker-compose.yml up --build --force-recreate --always-recreate-deps

clean:
# Container
	docker container prune --force

# Volume
    # docker volume prune --force
	docker-compose -f srcs/docker-compose.yml down -v

# Network
	docker network prune --force

# Image	
	docker image prune -a --force

fclean: clean
	sudo rm -rf ~/data/mariadb_data/*
	sudo rm -rf ~/data/wordpress_data/*

re : fclean up

.PHONY : up down restart re clean fclean