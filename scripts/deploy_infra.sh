#!/bin/bash
az group create -n k8sspoc -l westeurope

az aks create -n k8sspoc -g k8sspoc --generate-ssh-keys

az aks get-credentials -n k8sspoc -g k8sspoc

cat << EOF | kubectl apply -f - 
apiVersion: v1
kind: ServiceAccount
metadata:
  name: tiller
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: tiller
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
  - kind: ServiceAccount
    name: tiller
    namespace: kube-system
EOF

helm init --service-account tiller --node-selectors "beta.kubernetes.io/os"="linux"

sleep 40s

helm install stable/nginx-ingress --name nginxing -f ../helm-ingress/values.yaml

echo 'Infra setup.'