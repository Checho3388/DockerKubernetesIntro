# Ejercicio7
### Cantidad de containers: 2
```shell
➜  ejercicio07 git:(main) ✗ docker ps
CONTAINER ID   IMAGE                            COMMAND                  CREATED         STATUS          PORTS                                                                                            NAMES
2386b3b98f37   nicopaez/jobvacancy-ruby:1.3.0   "/jobvacancy/start_a…"   3 minutes ago   Up 3 minutes    0.0.0.0:3000->3000/tcp, :::3000->3000/tcp                                                        ejercicio07-web-1
26364b6581c1   postgres                         "docker-entrypoint.s…"   3 minutes ago   Up 3 minutes    5432/tcp                                                                                         ejercicio07-db-1
```
### Imágenes de los contenedores
Del comando anterior puedo ver que el primero está basado en `nicopaez/jobvacancy-ruby:1.3.0` mientras que el
otro de `postgres`.

### Descripción del compose

`version`: Versión del yml (describe sintaxis y comandos específicos)

`services` (`web`y `db`): Contenedor a desplegar

El resto de los atributos se describen como comentarios del `.yml`.
```yaml
    image: nicopaez/jobvacancy-ruby:1.3.0  # Imagen de la cual parte el contenedor
    links:  # Asocia `db` como dirección de red desde el contenedor `web`
      - db
    ports:  # Mapeo de puertos entre el contenedor y el host
      - "3000:3000"
    environment:  # Definición de variables de entorno que serán pasadas al contenedor
      PORT: "3000"
      RACK_ENV: "production"
      DATABASE_URL: "postgres://postgres:Passw0rd!@db:5432/postgres"
    depends_on:  # Dependencia en la inicialización del servicio 
      - db
```

### Visibilidad de red
Los contenedores pueden verse entre sí gracias a que se montan dentro de una misma
red creada por `compose`. Puede verse a continuación que se crea por defecto una red
llamada `ejercicio07_default`.

```shell
➜  ejercicio07 git:(main) ✗ docker network ls          
NETWORK ID     NAME                         DRIVER    SCOPE
a74b11b5cea1   bridge                       bridge    local
156dda2ee9ec   ejercicio07_default          bridge    local
4b27a6ec2974   host                         host      local
bca8a063f291   none                         null      local
```
Con un inspect se puede identificar que uno de los contenedores está montado sobre esa red.
```shell
➜  ejercicio06 git:(main) ✗ docker inspect 2386b3b98f37
# ...
            "Networks": {
                "ejercicio07_default": {
                    "IPAMConfig": null,
                    "Links": [
                        "ejercicio07-db-1:db",
                        "ejercicio07-db-1:db-1",
                        "ejercicio07-db-1:ejercicio07-db-1"
                    ],
                    "Aliases": [
                        "ejercicio07-web-1",
                        "web",
                        "2386b3b98f37"
                    ],
                    "NetworkID": "156dda2ee9ec3a798fe3753fc1e85036e9e6baffe3796c3cd609a9eabce2f6c0",
                    "EndpointID": "b3c8d42d42e373e3312a4118a813b51b994e7727f5f07760f3f62b0bc8a69ee1",
                    "Gateway": "172.19.0.1",
                    "IPAddress": "172.19.0.3",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:ac:13:00:03",
                    "DriverOpts": null
                }
            }
```
