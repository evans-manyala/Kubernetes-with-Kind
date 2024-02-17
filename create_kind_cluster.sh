#!/bin/bash

KIND_VERSION="v0.22.0" # Replace with latest version if needed

go install sigs.k8s.io/kind@${KIND_VERSION}

kind create cluster

kubectl get nodes # Verify cluster running

# Download and store kubeconfig securely
kind get kubeconfig > kubeconfig

# Make kubeconfig file more secure (optional)
chmod 600 kubeconfig

echo "Kubernetes cluster created and kubeconfig downloaded."
