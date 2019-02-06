#!/bin/bash

set -e

IPs=$(aws ec2 describe-instances | jq -r '.[]|.[].Instances[].NetworkInterfaces[].PrivateIpAddress')

for i in $IPs; do
    ssh $i -F ssh.config -C 'uname -a'
done