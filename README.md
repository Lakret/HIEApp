# HIEApp

  $ cd hieApp
  $ mix deps.get
  $ mix ecto.create
  $ mix phoenix.server

You can also run your app inside IEx (Interactive Elixir) as:

  $ iex -S mix phoenix.server

Postgres: 
sudo -i -u postgres 
ALTER USER postgres PASSWORD 'postgres';
