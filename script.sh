#!/bin/bash


echo "Criando as Imagens....."

docker build -t andrepg1184/projeto-backend:1.0 backend/.
docker build -t andrepg1184/projeto-database:1.0 database/.

echo "Realizando Push para Docker Hub...."
docker push andrepg1184/projeto-backend:1.0
docker push andrepg1184/projeto-database:1.0

echo "Criando Serviços Cluster kubernetes...."

kubectl apply -f ./services.yaml

echo "Criando os deployments....."

kubectl apply -f ./deployment.yaml 

