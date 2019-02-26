# README

_skerleton_ allows you to bootstrap a brand new Erlang project in seconds.

## Deprecation Note

This project is superseded by rebar3 and its templating mechanism.

## Quickstart

Create a new project based on skerleton and bootstrap it:

````
git clone https://github.com/robertoaloi/skerleton.git my_app
cd my_app
./bootstrap.sh
````

Remove the skerleton left-overs and you are ready to go:

````
rm -rf bootstrap.sh README.md .git rel/reltool.config.template
git init
git add . && git commit -a -m "Initial commit."
````

To start your Erlang node:

````
make rel
rel/my_app/bin/my_app console
````
