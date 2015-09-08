# Install git and vim
sudo apt-get update
sudo apt-get install -y vim git mercurial build-essential

# Install elixir
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install elixir

# Install hex
mix local.hex

# Install phoenix
mix archive.install https://github.com/phoenixframework/phoenix/releases/download/v1.0.2/phoenix_new-1.0.2.ez

# Install postgres
sudo apt-get install -y postgresql postgresql-contrib
sudo -u postgres createdb hieApp
