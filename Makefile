up :
# docker run -it --name nginx_container -p 443:443 nginx
	docker-compose -f srcs/docker-compose.yml up

down :
# docker-compose -f srcs/docker-compose.yml down
	docker-compose -f srcs/docker-compose.yml down

re :
	docker-compose -f srcs/docker-compose.yml up --build

clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\

ps :
	docker-compose -f srcs/docker-compose.yml ps

.PHONY : up down re clean ps