#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=fmmrm/rm-api
echo 'Step1 done'

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run rm-api\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=rm-api

#kubectl create deployment rm-api --image=$dockerpath --port=80

echo 'Step2 done'

# Step 3:
# List kubernetes pods
kubectl get pods
echo 'Step3 done'


# Step 4:
# Forward the container port to a host
kubectl port-forward rm-api 8000:80
echo 'Step4 done'
