#!/bin/bash


export AWS_PROFILE=tf_admin && kops create cluster \
  --cloud=aws \
  --cloud-labels="environment=dev,project=vault-demo,kubernetes.io/cluster/vault-demo.mecloud.online=shared" \
  --name=vault-demo.mecloud.online \
  --dns-zone=mecloud.online \
  --authorization=rbac \
  --state=s3://terraform-state-zeepupualeer \
  --api-loadbalancer-type=public \
  --node-count=3 \
  --node-tenancy=default \
  --vpc=vpc-043b3254f177ba590 \
  --network-cidr=90.80.0.0/21 \
  --subnets="subnet-004f1a62b1f60a0c1,subnet-00cc5bf7d76c69ac2,subnet-066ba15732a54bb9c" \
  --utility-subnets="subnet-0837038830e4c17e0,subnet-0bac9655b5022e26d,subnet-0a20b72ddb45221ac" \
  --encrypt-etcd-storage \
  --node-size=t2.medium \
  --master-size=t2.medium \
  --master-zones="eu-west-1a,eu-west-1b,eu-west-1c" \
  --master-tenancy=default \
  --zones="eu-west-1a,eu-west-1b,eu-west-1c" \
  --networking=weave \
  --associate-public-ip=false \
  --topology=private \
  --bastion="true" \
  --kubernetes-version=v1.11.6 \
  --ssh-public-key=./keys/k8s/kubernetes_rsa.pub \
  --out=. \
  --target=terraform
