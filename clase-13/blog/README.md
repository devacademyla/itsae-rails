# Asset pipeline

* Crear un nuevo proyecto que se llame Blog:

```console
$ rails new blog
```

* Generar el nuevo model Post

```console
$ rails generate model Post titulo:string texto:text
```

* Correr la migración:
```console
$ rake db:migrate
```

* Editar routes.rb
```ruby
resources :posts, only: [:index, :create]
```

* Agregar posts_controller.rb dentro de app/controllers:
```ruby
class PostsController < ApplicationController
end
```

* Agregar la acción index en el controller Posts y envía todos los posts en formato json:
```ruby
class PostsController < ApplicationController
  def index
    render json: Post.all
  end
end
```

* Para ver toda la funcionalidad creada, ingresar a:
Ingresar a [localhost:3000/posts](http://localhost:3000/posts)

* Agregar la acción show en el controller Posts:
```ruby
class PostsController < ApplicationController
  def show
    render json: Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: 'No existe', status: :not_found
  end
end
```
* En el código anterior se está cambiando el HTTP status code que se envía al no encontrar un post.

* Genera data de prueba, entra a tu consola y crea un nuevo post:
```console
$ rails console
> Post.create(titulo: 'Post 1', texto: 'Este es un nuevo post')
> Post.create(titulo: 'Post 2', texto: 'Este es otro nuevo post')
```

* Para ver toda la funcionalidad creada, ingresar a:
Ingresa para ver un post existente [localhost:3000/posts/1](http://localhost:3000/posts/1)
Ingresa para intentar ver un post no existente [localhost:3000/posts/100](http://localhost:3000/posts/100)