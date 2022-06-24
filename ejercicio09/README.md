# Ejercicio 9
> Nota: `mk` es el alias de `minikube kubectl`

Una vez levantado `minikube` aplico el deployment con el siguiente comando:
```shell
➜  ejercicio09 git:(main) ✗ mk apply -f deployment.yaml                                                   
deployment.apps/passwordapi created
```
Y verifico la creación de los 3 pods con:
```shell
➜  ejercicio09 git:(main) ✗ mk get pods
NAME                           READY   STATUS              RESTARTS   AGE
passwordapi-5dd5f46c96-2v2sf   0/1     ContainerCreating   0          6m10s
passwordapi-5dd5f46c96-c9slj   0/1     ContainerCreating   0          6m10s
passwordapi-5dd5f46c96-kkgvx   0/1     ContainerCreating   0          6m10s
```
Una vez que `STATUS` se pone en `Running` puedo correr la validación usando el nombre de alguno de los pods
como se indica en el ejercicio.
```shell
➜  ejercicio09 git:(main) ✗ mk get pods
NAME                           READY   STATUS    RESTARTS   AGE
passwordapi-5dd5f46c96-2v2sf   1/1     Running   0          10m
passwordapi-5dd5f46c96-c9slj   1/1     Running   0          10m
passwordapi-5dd5f46c96-kkgvx   1/1     Running   0          10m
➜  ejercicio09 git:(main) ✗ mk exec -it "passwordapi-5dd5f46c96-2v2sf" --  bash
root@passwordapi-5dd5f46c96-2v2sf:/usr/src/app# curl localhost:3000/password
{"password":"!767SsSs==Uu"}
root@passwordapi-5dd5f46c96-2v2sf:/usr/src/app# 
```