# ---------------------------------------------------------------------------------------------------------------------
# THE USER DATA SCRIPT THAT WILL RUN ON EACH VAULT SERVER WHEN IT'S BOOTING
# This script will configure and start Vault
# ---------------------------------------------------------------------------------------------------------------------

data "template_file" "user_data_vault_cluster" {
  template = "${file("${path.module}/vault-data/user-data-vault.sh")}"

  vars {
    aws_region               = "${data.aws_region.current.name}"
    s3_bucket_name           = "useless-mobi-vault-storage"
    dynamo_table_name        = "${aws_dynamodb_table.vault-ha-table.name}"
    consul_cluster_tag_key   = "Name"
    consul_cluster_tag_value = "vault-ha-cluster"
  }
}


# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY THE VAULT SERVER CLUSTER
# ---------------------------------------------------------------------------------------------------------------------

module "vault_cluster" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "github.com/hashicorp/terraform-aws-consul.git/modules/vault-cluster?ref=v0.0.1"
  source = "modules/vault-cluster"

  cluster_name  = "vault-cluster"
  cluster_size  = 3
  instance_type = "t3.micro"

  ami_id    = "ami-0a65c2cd08c919357"
  user_data = "${data.template_file.user_data_vault_cluster.rendered}"

  enable_s3_backend       = true
  s3_bucket_name          = "useless-mobi-vault-storage"
  force_destroy_s3_bucket = false

  vpc_id     = "${aws_vpc.main.id}"
  subnet_ids = "${data.aws_subnet_ids.private_subnet_ids.ids}"

  # To make testing easier, we allow requests from any IP address here but in a production deployment, we *strongly*
  # recommend you limit this to the IP address ranges of known, trusted servers inside your VPC.

  allowed_ssh_cidr_blocks              = ["90.80.4.43/32"]
  allowed_inbound_cidr_blocks          = ["90.80.0.0/21"]
  allowed_inbound_security_group_ids   = []
  allowed_inbound_security_group_count = 0
  ssh_key_name                         = "${aws_key_pair.vault_key.key_name}"
  cluster_extra_tags                   = [
    {
      key = "Name"
      value = "vault-cluster-nodes"
      propagate_at_launch = true
    }
  ]
}

# ---------------------------------------------------------------------------------------------------------------------
# ATTACH IAM POLICIES FOR CONSUL
# To allow our Vault servers to automatically discover the Consul servers, we need to give them the IAM permissions from
# the Consul AWS Module's consul-iam-policies module.
# ---------------------------------------------------------------------------------------------------------------------

module "consul_iam_policies_servers" {
  source = "modules/consul-iam-policies"

  iam_role_id = "${module.vault_cluster.iam_role_id}"
  dynamodb_arn = "${aws_dynamodb_table.vault-ha-table.arn}"
}

resource "aws_dynamodb_table" "vault-ha-table" {
  name           = "vault-ha-table"
  read_capacity  = 10
  write_capacity = 15
    hash_key       = "Path"
    range_key      = "Key"
    attribute = [
        {
            name = "Path"
            type = "S"
        },
        {
            name = "Key"
            type = "S"
        }
    ]
  tags {
    Name        = "vault-ha-table"
    Environment = "prod"
  }
}

resource "aws_key_pair" "vault_key" {
  key_name   = "vault-ssh-key"
  public_key = "${file("keys/vault/vault_rsa.pub")}"
}
