#!/bin/sh
VERSION=0.1.3
mkdir deployment
cd deployment
git clone git@github.com:hackovid-dropplets-team/tickets-backend.git
cd tickets-backend
docker build -t hackoviddroppletsteam/tickets-backend:$VERSION tickets-backend
docker push hackoviddroppletsteam/tickets-backend:$VERSION
docker rmi hackoviddroppletsteam/tickets-backend:$VERSION
cd ../..
rm -rf deployment
kubectl set image deployment.apps/tickets tickets=hackoviddroppletsteam/tickets-backend:$VERSION -n=tickets
# kubectl delete -f deployment.yaml
# kubectl create -f deployment.yaml 