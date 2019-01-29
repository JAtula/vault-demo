provider "aws" {
    region                  = "eu-west-1"
    shared_credentials_file = "./creds"
    profile                 = "tf_admin"
    version                 = ">= v1.57.0"
}

terraform {
    backend "s3" {
        bucket                  = "terraform-state-eichievaejip"
        key                     = "states/terraform.tfstate"
        region                  = "eu-west-1"
        profile                 = "tf_admin"
        shared_credentials_file = "./creds"
        dynamodb_table          = "terraform-state"
    }
}
