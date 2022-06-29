# Inception [![bahn's 42 Inception Score](https://badge42.vercel.app/api/v2/cl1n6fb2j003009l0lfanbfyx/project/2586655)](https://github.com/JaeSeoKim/badge42)
# [Notion](https://jr-developer-ahngbeom.notion.site/Inception-6b39cf29a72d4b2ca959f08a3619847d)

## How to

- Docker Container Build
	```bash
	make
	make up
	```
- Remove all unused Docker Container, Volume, Network...
	```bash
	make clean
	```
- Docker Container Re-Build (make clean & make up)
	```bash
	make re
	```
- Docker Container Restart
	```bash
	make restart
	```
- Remove Docker Mount Volume of Host System (sudo)
	```bash
	make fclean
	```
## Testing
[https://bahn.42.fr](https://bahn.42.fr) -> Intra ID가 담긴 주소를 요청해도 정상적으로 동작하는가?

[https://bahn.42.fr/wp-admin](https://bahn.42.fr/wp-admin) -> 관리자 페이지가 출력되는가?

[https://bahn.42.fr/wp-login.php](https://bahn.42.fr/wp-login.php) -> 로그인 페이지가 출력되는가?

[https://bahn.42.fr/index.php](https://bahn.42.fr/index.php) -> index.php 파일을 파라미터로 요청해도 페이지가 정상적으로 출력되는가?

---

**`docker ps`**

```bash
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS         PORTS                                       NAMES
b0cc822390d3   inception_nginx       "/var/temp/nginx-ini…"   3 minutes ago   Up 3 minutes   0.0.0.0:443->443/tcp, :::443->443/tcp       nginx
4869db4700d9   inception_wordpress   "/var/temp/wp-init.s…"   3 minutes ago   Up 3 minutes   0.0.0.0:9000->9000/tcp, :::9000->9000/tcp   wordpress
c869c56c8921   inception_mariadb     "/var/tmp/db-init.sh…"   3 minutes ago   Up 3 minutes   0.0.0.0:3306->3306/tcp, :::3306->3306/tcp   mariadb
```

**`docker network ls`**

```bash
NETWORK ID     NAME                          DRIVER    SCOPE
bd061e06d405   bridge                        bridge    local
17e5ec48c562   host                          host      local
aedcc61053fb   inception_inception-network   bridge    local
32db591ba25f   none                          null      local
```

**`docker volume ls`**

```bash
DRIVER    VOLUME NAME
local     inception_mariadb_data
local     inception_wordpress_data
```