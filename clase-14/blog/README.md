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

## CanCan

* Agregar el campo rol a la table user:
```console
$ rails generate migration add_rol_to_users rol:string
$ rake db:migrate
```

* Agregar la gema cancan a la aplicación, agregar en el Gemfile:
```ruby
gem 'cancan'
```

```console
$ bundle install
```

* Generar el Ability, ejecutar
```console
$ rails generate cancan:ability
```

* En el Ability configurar los accesos de acuerdo al rol. Editar en models/ability.rb
```ruby
user ||= User.new
if user.rol == 'admin'
  can :manage, :all
else
  can :read, :all
end
```

* Enviar una variable global con todos los usuarios en la página principal, editar el home_controller:
```ruby
class HomeController < ApplicationController
  def index
    @usuarios = User.all
  end
end
```

* Agregar la lista de usuarios en home/index.html.erb:
```html
<h1>Página principal</h1>
<h2>Usuarios</h2>
<ul>
  <% @usuarios.each do |usuario| %>
    <li><%= usuario.email %></li>
  <% end %>
</ul>
```

* Controlar que se muestre o no para crear nuevas usuarios. En home/index.html.erb, editar:
```html
<h1>Página principal</h1>
<h2>Usuarios</h2>
<ul>
  <% @usuarios.each do |usuario| %>
    <li>
      <%= usuario.email %>
    </li>
  <% end %>
  <% if can? :create, @usuarios %>
    <%= link_to "Crear", '/other' %>
  <% end %>
</ul>
```