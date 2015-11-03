== Introducción a Ruby on Rails

* Creamos un nuevo proyecto en Rails llamado demo, escribir en la terminal:

```console
$ rails new demo
```

* Ingresamos al proyecto para poder ver su estructura, escribir en la terminal:

```console
$ cd demo
```

* Para inicializar nuestro servidor y visualizar nuestro proyecto:

```console
$ rails server
```

Ingresar a [localhost:3000](http://localhost:3000/)


* Para crear nuevas vistas en nuestro proyecto: Hola y Adios, escribir en la terminal:

```console
$ rails generate controller Saludo hola adios
```

* Se podrá observar que tenemos dos nuevas vistas:
Para la vista hola: [localhost:3000/saludo/hola](http://localhost:3000/saludo/hola)
Para la vista adios: [localhost:3000/saludo/adios](http://localhost:3000/saludo/adios)

* Para editar una de las vistas debemos ingresar a app/views/saludo/hola.html.erb y editar el archivo como si fuera un html:

```html
<h1>Hola ITSAE!</h1>
```
