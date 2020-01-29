#!/bin/sh
git clone https://gitlab.com/lleialtec/gngforms.git app
docker build -t registry.lesquerra.cat/gngforms .
docker push registry.lesquerra.cat/gngforms
docker rmi registry.lesquerra.cat/gngforms
rm -rf app