#!/bin/bash

set -e

POD_NAME=$(kubectl get pods --namespace "default" -l "app=openvpn,release=vpn" -o jsonpath='{ .items[0].metadata.name }')
SERVICE_NAME=$(kubectl get svc --namespace "default" -l "app=openvpn,release=vpn" -o jsonpath='{ .items[0].metadata.name }')
SERVICE_IP=$(kubectl get svc --namespace "default" "$SERVICE_NAME" -o go-template='{{ range $k, $v := (index .status.loadBalancer.ingress 0)}}{{ $v }}{{end}}')
KEY_NAME=$1
kubectl --namespace "default" exec -it "$POD_NAME" /etc/openvpn/setup/newClientCert.sh "$1" "$SERVICE_IP"
kubectl --namespace "default" exec -it "$POD_NAME" cat "/etc/openvpn/certs/pki/$1.ovpn" > "$1.ovpn"