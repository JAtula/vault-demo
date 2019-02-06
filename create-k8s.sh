#!/bin/bash

private_subnets=$(terraform output -json private_subnet_ids | jq -r .value[] | tr '\n' ',' | sed 's/\(.*\),/\1/')
utility_subnets=$(terraform output -json utility_subnet_ids | jq -r .value[] | tr '\n' ',' | sed 's/\(.*\),/\1/')

export AWS_PROFILE=default && kops create cluster \
  --cloud=aws \
  --cloud-labels="environment=dev,project=vault-demo,kubernetes.io/cluster/vault-demo.useless.mobi=shared" \
  --name=vault-demo.useless.mobi \
  --dns-zone=useless.mobi \
  --authorization=rbac \
  --state="s3://$(terraform output state_bucket_name | tr -d '\n')" \
  --api-loadbalancer-type=public \
  --node-count=3 \
  --node-tenancy=default \
  --vpc="$(terraform output vpc_id | tr -d '\n')" \
  --network-cidr=90.80.0.0/21 \
  --subnets="$private_subnets" \
  --utility-subnets="$utility_subnets" \
  --disable-subnet-tags \
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
  --target=terraform \
  -v 0
