#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

## Variables
DOCKER_ID="johnnynguyen541"
TAG_ID="sklearn-api"
IMAGE_VERSION="v1.0.0"

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
export DOCKERPATH="$DOCKER_ID/$TAG_ID:$IMAGE_VERSION"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run $TAG_ID --image=$DOCKERPATH  --port=80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward pod/$TAG_ID --address 127.0.0.1 8080:80

# Log Output
kubectl logs $TAG_ID $TAG_ID