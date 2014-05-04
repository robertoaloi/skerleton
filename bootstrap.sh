#!/bin/bash

APPS=apps
APP=$(basename `pwd`)
REL=rel

mkdir -p $APPS/$APP

echo "[skerleton] ==> Creating application $APP"
pushd $APPS/$APP
../../rebar create-app appid=$APP
popd

echo "[skerleton] ==> Patching rebar.config"
sed -i.bkp "s/skerleton/$APP/g" rebar.config
rm rebar.config.bkp

echo "[skerleton] ==> Creating node $APP"
pushd $REL
../rebar create-node nodeid=$APP
popd

echo "[skerleton] ==> Patching reltool.config"
sed "s/skerleton/$APP/g" > $REL/reltool.config < $REL/reltool.config.template

echo "[skerleton] ==> You are now ready to go!"
echo "[skerleton] ==> You can remove the skerleton left-overs by running:"
echo "\n\trm -rf bootstrap.sh README.md .git rel/reltool.config.template"
echo "\n\tgit init"
echo "\n\tgit add . && git commit -a -m 'Initial commit.'"
echo "\n"
