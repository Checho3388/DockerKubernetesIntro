# Pingapp

Comandos ejecutados para subir la imagen en mi propio repositorio de DockerHub
```shell
$ docker pull nicopaez/pingapp:3.0.0
$ docker tag nicopaez/pingapp:3.0.0 ezequielgrondona/pingapp:1.0.0
$ docker login
$ docker push ezequielgrondona/pingapp:1.0.0
```

Para bajarla:
```shell
$ docker pull ezequielgrondona/pingapp:1.0.0
```
