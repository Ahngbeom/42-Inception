# 2C-ft_server [![bahn's 42 ft_server Score](https://badge42.vercel.app/api/v2/cl1n6fb2j003009l0lfanbfyx/project/2100321)](https://github.com/JaeSeoKim/badge42)

## How to

```bash
docker build . -t ft_server
```

```bash
docker run -it --name ft_server -p 80:80 -p 443:443 ft_server
```

## Testing
[http://localhost](http://localhost/) -> https로 리디렉션되는가?

[http://localhost:80](http://localhost/) -> https로 리디렉션되는가?

[https://localhost:443](https://localhost/) -> OpenSSL 프로토콜로 동작되는가?

[https://localhost/wordpress](https://localhost/wordpress) -> wordpress 페이지 확인

[https://localhost/phpmyadmin](https://localhost/phpmyadmin) -> phpMyAdmin 페이지 확인