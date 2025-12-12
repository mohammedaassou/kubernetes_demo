#!/usr/bin/env bash
set -euo pipefail

NAME="kubernetes-demo-api"
USERNAME="mohamedaassouu"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker image..."
docker build -t "$IMAGE" .

echo "Pushing image to Docker Hub..."
# make sure you're logged in: `docker login`
docker push "$IMAGE"

echo "Applying kubernetes manifest ..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Get pods..."
kubectl get pods

echo "Get services..."
kubectl get services

echo "Fetching the main service..."
kubectl get services "${NAME}-service"