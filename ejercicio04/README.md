# Ejercicio4
## Elección de la imagen
Para buscar la imagen base, busqué en docker hub qué imágenes existentes me permiten correr una aplicación Java.

```
https://hub.docker.com/search?q=java
```

Dentro de las primeras, listadas como `DOCKER OFFICIAL IMAGE` encontré una llamada "java" con una leyenda "DEPRECATED; use "openjdk" ..". Al leer la documentación y encontrar ejemplos de cómo correr una aplicación `java` me pareció adecuada. Podría haber utilizado o buscado una versión minimalista (`alpine`) pero para los fines del ejercicio lo dejé con `openjdk:11`.

## Publicación de la imagen
Comandos
```shell
➜  ejercicio04 git:(main) ✗ docker tag passwordapi ezequielgrondona/passwordapi:1.0.0
➜  ejercicio04 git:(main) ✗ docker push ezequielgrondona/passwordapi:1.0.0 
```
URL de la imagen: https://hub.docker.com/repository/docker/ezequielgrondona/passwordapi
