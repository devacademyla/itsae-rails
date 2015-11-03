# Inicio rápido con Scaffolding

* Desde el proyecto hecho en la primera clase se creará un scaffolding para el recurso Producto, escribir en la terminal:

```console
$ rails generate scaffold Producto titulo:string descripcion:text precio:decimal
```

* Luego debemos correr las migraciones pendientes:

```console
$ rake db:migrate
```

* Para ver toda la funcionalidad creada, ingresar a:

Ingresar a [localhost:3000/productos](http://localhost:3000/productos)


* Si nos equivocamos al generar el scaffold, podemos revertirlo:

```console
$ rails destroy scaffold Producto
```

* También debemos regresar la migración que hemos realizado y eliminar la migración creada:

```console
$ rake db:rollback
```

* Si adicionalmente necesitas resetear la base de datos, puedes usar el comando:

```console
$ rake db:reset
```