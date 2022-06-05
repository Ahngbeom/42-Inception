build-up :
	docker-compose -f srcs/docker-compose.yml up -d --build

build-down :
	docker-compose -f srcs/docker-compose.yml down

.PHONY : build-up build-down

