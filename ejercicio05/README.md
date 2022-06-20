# Ejercicio 5

## HEALTHCHECK
https://docs.docker.com/engine/reference/builder/#healthcheck
Instrucción que le indica a Docker cómo evaluar si un contenedor se encuentra en funcionamiento.

Por ejemplo, puede servir para chequear cada N minutos si un web server puede servir la página principal.
```Dockerfile
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
```


## ONBUILD
Para generar "triggers" dentro de una imagen que serán ejecutados posteriormente cuando la imagen sea utilizada como imagen base para otro.
Estos comandos no son corridos en la imagen donde se definen, sino en la imagen dónde se utilizan como base inmediatamente después del comando `FROM`.

Por ejemplo, existen algunas imágenes de Python taggeadas `on-build` que tienen por defecto la llamada a la instrucción para copiar el `requirements.txt` y hacer la llamada a `pip install`.

https://hub.docker.com/layers/python/library/python/3.5.2-onbuild/images/sha256-0053e86b9dabe43c6b603b6f7e55bf63ab03e4e852f938b6a6e21a03e618ad75?context=explore

Este comando no puede ejecutarse en la imagen base ya que la misma no contiene las dependencias de la app. 

## VOLUME
Crea un punto de montaje en el contenedor mapeado a una ubicación en el host.
Si el directorio elegido tiene archivos estos serán copiados. Adicionalmente, los archivos de la ubicación persistirán en el host.
