up:
	@mkdir -p ~/data/mariadb_data
	@mkdir -p ~/data/wordpress_data
# docker-compose -f srcs/docker-compose.yml -p inception up --build --detach
	docker-compose -f srcs/docker-compose.yml -p inception up --build

down:
	docker-compose -f srcs/docker-compose.yml -p inception down

restart:
	docker-compose -f srcs/docker-compose.yml -p inception restart

clean: down
### Container
	docker container prune --force

### Volume
	docker volume prune --force

### Network
	docker network prune --force

### Image	
	docker image prune -a --force

fclean: clean
	sudo rm -rf ~/data/mariadb_data/*
	sudo rm -rf ~/data/wordpress_data/*

re : clean up

.PHONY : up down restart clean fclean re