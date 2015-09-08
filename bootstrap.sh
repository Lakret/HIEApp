# Install git and vim
sudo apt-get update
sudo apt-get install -y vim git mercurial build-essential

# Install elixir
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install -y elixir

# Install hex
mix local.hex

# Install phoenix
mix archive.install https://github.com/phoenixframework/phoenix/releases/download/v1.0.2/phoenix_new-1.0.2.ez

# Install inotify
sudo apt-get install -y inotify-tools

# Install node
# curl -sL https://deb.nodesource.com/setup | sudo bash -
# sudo apt-get install -y nodejs
sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | sudo NVM_DIR=/usr/local/nvm bash
nvm install 0.12

# Install postgres
sudo apt-get install -y postgresql postgresql-contrib
sudo -u postgres createdb hieApp
