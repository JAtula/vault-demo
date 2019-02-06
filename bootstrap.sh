#!/bin/bash

set -e

if [[ -z $1 || -z $2 ]]; then
    printf 'Need to input AWS profile name and region\nExample: ./boostrap.sh tf_admin eu-west-1\n'
    exit 1
else
    # Setup best practise stuff for TF
    bucketName=terraform-state-$(pwgen 12 1 -0 -A)
    aws s3api create-bucket --bucket $bucketName --create-bucket-configuration LocationConstraint=$2 --acl private --profile=$1
    aws s3api put-bucket-versioning --bucket $bucketName --versioning-configuration Status=Enabled --profile $1
    aws s3api put-bucket-encryption --bucket $bucketName --server-side-encryption-configuration '{"Rules": [{"ApplyServerSideEncryptionByDefault": {"SSEAlgorithm": "AES256"}}]}' --profile $1
    aws dynamodb create-table --table-name terraform-state --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=20,WriteCapacityUnits=20 --profile $1

    # Write the main.tf file
    cat << EOF > main.tf
provider "aws" {
    region                  = "eu-west-1"
    shared_credentials_file = "./creds"
    profile                 = "tf_admin"
    version                 = ">= v1.57.0"
}

terraform {
    backend "s3" {
        bucket                  = "$bucketName"
        key                     = "states/terraform.tfstate"
        region                  = "eu-west-1"
        profile                 = "tf_admin"
        shared_credentials_file = "./creds"
        dynamodb_table          = "terraform-state"
    }
}

data "aws_s3_bucket" "state-bucket" {
  bucket = "$bucketName"
}

output "state_bucket_name" {
  value = "${data.aws_s3_bucket.state-bucket.id}"
}
EOF

fi
