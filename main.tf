provider "aws" {
    region                  = "eu-west-1"
    shared_credentials_file = "./creds"
    profile                 = "tf_admin"
    version                 = ">= v1.57.0"
}

terraform {
    backend "s3" {
        bucket                  = "terraform-state-nahghifiukae"
        key                     = "states/terraform.tfstate"
        region                  = "eu-west-1"
        profile                 = "tf_admin"
        shared_credentials_file = "./creds"
        dynamodb_table          = "terraform-state"
    }
}
data "aws_region" "current" {}
data "aws_s3_bucket" "state-bucket" {
  bucket = "terraform-state-nahghifiukae"
}

output "state_bucket_name" {
  value = "${data.aws_s3_bucket.state-bucket.id}"
}

