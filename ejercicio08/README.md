# Ejercicio8
El archivo `docker-compose.yml` describe la solución con dos servicios web y un balanceador.
La forma de correrlo es:
```shell
docker compose up
```
Para verificar el correcto balanceo se puede ejecutar el siguiente comando:
```shell
$ curl localhost:8080/health
{"host":"4cf6b409c338","loadavg":[2.37109375,2.373046875,2.1201171875],"freemem":4254732288,"appversion":"1.0.0"}%
$ curl localhost:8080/health
{"host":"4cf6b409c338","loadavg":[2.26123046875,2.35009765625,2.11376953125],"freemem":4257087488,"appversion":"1.0.0"}%
$ curl localhost:8080/health
{"host":"d0c1705adf7c","loadavg":[2.26123046875,2.35009765625,2.11376953125],"freemem":4247851008,"appversion":"1.0.0"}%
$ curl localhost:8080/health
{"host":"4cf6b409c338","loadavg":[2.26123046875,2.35009765625,2.11376953125],"freemem":4248571904,"appversion":"1.0.0"}%
$ curl localhost:8080/health
{"host":"d0c1705adf7c","loadavg":[2.26123046875,2.35009765625,2.11376953125],"freemem":4262486016,"appversion":"1.0.0"}% 
```
Se puede observar que los 2 contenedores levantados responden las solicitudes `HTTP`.
```shell
$ docker ps
CONTAINER ID   IMAGE                                 COMMAND                  CREATED         STATUS          PORTS                                                                                                                                  NAMES
03f41b94e5d3   nginx:alpine                          "/docker-entrypoint.…"   3 minutes ago   Up 3 minutes    80/tcp, 0.0.0.0:8080->8080/tcp, :::8080->8080/tcp                                                                                      ejercicio08-balancer-1
d0c1705adf7c   nicopaez/password-api                 "npm start"              3 minutes ago   Up 3 minutes    3000/tcp                                                                                                                               ejercicio08-websrv1-1
4cf6b409c338   nicopaez/password-api                 "npm start"              3 minutes ago   Up 3 minutes    3000/tcp                                                                                                                               ejercicio08-websrv2-1
```

## Consideraciones usando `--scale`
Estuve bastante tiempo intentando describir un único servicio `websrv` dentro del `.yml` y
luego correr la aplicación utilizando:

```shell
docker compose up --scale websrv=2
```

Sin embargo, para que esta solución sea realmente dinámica debía encontrar
una forma de poder redireccionar los requests a través de `nginx` a los servidores
balanceados (1, 2 o `N`). Dicho de otra forma, no serviría de nada levantar la applicación
utilizando el parámetro `--scale` si la configuración de nginx contiene `websrv1` y 
`websrv2` fijos (o el nombre que se le asigne al levantar el contenedor de dicha forma):
```nginx configuration
upstream backend {
    random;  # A modo de prueba para el ejercicio
    server websrv1:3000;
    server websrv2:3000;
}
```
_Busqué formas dinámicas de completar la configuración en nginx pero no las encontré._
