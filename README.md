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



mix phoenix.gen.json FormModel formmodels data:map
mix ecto.migrate


sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install postgresql-9.4
sudo /etc/init.d/postgresql stop

# change configs to prevent old postges from running
sudo vim /etc/postgresql/9.3/main/start.conf
# Replace the last line "auto" by "disabled".

# remove old postges
sudo apt-get remove postgresql-9.3 postgresql-9.3-ip4r postgresql-9.3-postgis-2.1 postgresql-9.3-postgis-scripts postgresql-client-9.3 postgresql-contrib-9.3

# change all to trust in /etc/postgresql/9.4/main/pg_hba.conf 

sudo vim /etc/postgresql/9.4/main/postgresql.conf
# change listen_addresses = '*'
sudo service postgresql reload



tail -f /var/log/postgresql/postgresql-9.4-main.log
sudo netstat -lp --protocol=unix | grep postgres
sudo netstat -nlp | grep 5432


https://renatomoya.github.io/2015/05/09/Building-a-versioned-REST-API-with-Phoenix-Framework.html
http://localhost:4000/api/formmodels
