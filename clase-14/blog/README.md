# Autenticación y Autorización de usuarios

## Devise

* Crear un nuevo proyecto que se llame Blog:

```console
$ rails new blog
```

* Agregar la gema 'devise' en el Gemfile:
```ruby
gem 'devise'
```

* Ejecutar el comando:
```console
$ bundle install
```

* Configuración devise en la aplicación, ejecutar:
```console
$ rails g devise:install
```

* Asegurar que se ha definido las opciones de url por defecto en config/environments/development.rb, agregar:
```ruby
config.action_mailer.default_url_options = { host: 'localhost:3000' }
```

* En app/views/layouts/application.html.erb, agregar antes del yield:
```ruby
<p><%= notice %></p>
<p><%= alert %></p>
```

* Generar el model User, ejecutar el comando:
```console
$ rails g devise user nombre username
$ rake db:migrate
```

* Agregar una página raíz, agregar en config/routes.rb:
```ruby
root 'home#index'
```

* Crear en app/controllers, el archivo home_controller.rb:
```ruby
class HomeController < ApplicationController
end
```

* Crear en app/views/home, el archivo index.html.erb:
```html
<h1>Página principal</h1>
```

* Inicia tu servidor:
```console
$ rails server
```

* Crea tu primer usuario, ingresa a [localhost:3000/users/sign_up](http://localhost:3000/users/sign_up)

* En app/views/layouts/application.html.erb, agregar antes del yield:
```ruby
<% if user_signed_in? %>
  <%= link_to 'Cerrar sesión', destroy_user_session_path, method: :delete %>
<% else %>
  <%= link_to 'Iniciar sesión', new_user_session_path %>
<% end %>
```
* Ingresa a [localhost:3000](http://localhost:3000)