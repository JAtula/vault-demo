locals = {
  bastion_autoscaling_group_ids = ["${aws_autoscaling_group.bastions-vault-demo-useless-mobi.id}"]
  bastion_security_group_ids    = ["${aws_security_group.bastion-vault-demo-useless-mobi.id}"]
  bastions_role_arn             = "${aws_iam_role.bastions-vault-demo-useless-mobi.arn}"
  bastions_role_name            = "${aws_iam_role.bastions-vault-demo-useless-mobi.name}"
  cluster_name                  = "vault-demo.useless.mobi"
  master_autoscaling_group_ids  = ["${aws_autoscaling_group.master-eu-west-1a-masters-vault-demo-useless-mobi.id}", "${aws_autoscaling_group.master-eu-west-1b-masters-vault-demo-useless-mobi.id}", "${aws_autoscaling_group.master-eu-west-1c-masters-vault-demo-useless-mobi.id}"]
  master_security_group_ids     = ["${aws_security_group.masters-vault-demo-useless-mobi.id}"]
  masters_role_arn              = "${aws_iam_role.masters-vault-demo-useless-mobi.arn}"
  masters_role_name             = "${aws_iam_role.masters-vault-demo-useless-mobi.name}"
  node_autoscaling_group_ids    = ["${aws_autoscaling_group.nodes-vault-demo-useless-mobi.id}"]
  node_security_group_ids       = ["${aws_security_group.nodes-vault-demo-useless-mobi.id}"]
  node_subnet_ids               = ["subnet-06b1d6094b71fed3d", "subnet-0a2497254954840d4", "subnet-0f34944d2f036c22b"]
  nodes_role_arn                = "${aws_iam_role.nodes-vault-demo-useless-mobi.arn}"
  nodes_role_name               = "${aws_iam_role.nodes-vault-demo-useless-mobi.name}"
  region                        = "eu-west-1"
  subnet_eu-west-1a_id          = "subnet-0f34944d2f036c22b"
  subnet_eu-west-1b_id          = "subnet-06b1d6094b71fed3d"
  subnet_eu-west-1c_id          = "subnet-0a2497254954840d4"
  subnet_ids                    = ["subnet-01f0757b77ef3d4e1", "subnet-0543b5d10bd887a5b", "subnet-06b1d6094b71fed3d", "subnet-093e9b3ab369ce081", "subnet-0a2497254954840d4", "subnet-0f34944d2f036c22b"]
  subnet_utility-eu-west-1a_id  = "subnet-093e9b3ab369ce081"
  subnet_utility-eu-west-1b_id  = "subnet-01f0757b77ef3d4e1"
  subnet_utility-eu-west-1c_id  = "subnet-0543b5d10bd887a5b"
  vpc_id                        = "vpc-07c93b78357bb8450"
}

output "bastion_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.bastions-vault-demo-useless-mobi.id}"]
}

output "bastion_security_group_ids" {
  value = ["${aws_security_group.bastion-vault-demo-useless-mobi.id}"]
}

output "bastions_role_arn" {
  value = "${aws_iam_role.bastions-vault-demo-useless-mobi.arn}"
}

output "bastions_role_name" {
  value = "${aws_iam_role.bastions-vault-demo-useless-mobi.name}"
}

output "cluster_name" {
  value = "vault-demo.useless.mobi"
}

output "master_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.master-eu-west-1a-masters-vault-demo-useless-mobi.id}", "${aws_autoscaling_group.master-eu-west-1b-masters-vault-demo-useless-mobi.id}", "${aws_autoscaling_group.master-eu-west-1c-masters-vault-demo-useless-mobi.id}"]
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-vault-demo-useless-mobi.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-vault-demo-useless-mobi.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-vault-demo-useless-mobi.name}"
}

output "node_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.nodes-vault-demo-useless-mobi.id}"]
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-vault-demo-useless-mobi.id}"]
}


output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-vault-demo-useless-mobi.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-vault-demo-useless-mobi.name}"
}

output "region" {
  value = "eu-west-1"
}
# output "node_subnet_ids" {
#   value = ["subnet-06b1d6094b71fed3d", "subnet-0a2497254954840d4", "subnet-0f34944d2f036c22b"]
# }

# output "subnet_eu-west-1a_id" {
#   value = "subnet-0f34944d2f036c22b"
# }

# output "subnet_eu-west-1b_id" {
#   value = "subnet-06b1d6094b71fed3d"
# }

# output "subnet_eu-west-1c_id" {
#   value = "subnet-0a2497254954840d4"
# }

# output "subnet_ids" {
#   value = ["subnet-01f0757b77ef3d4e1", "subnet-0543b5d10bd887a5b", "subnet-06b1d6094b71fed3d", "subnet-093e9b3ab369ce081", "subnet-0a2497254954840d4", "subnet-0f34944d2f036c22b"]
# }

# output "subnet_utility-eu-west-1a_id" {
#   value = "subnet-093e9b3ab369ce081"
# }

# output "subnet_utility-eu-west-1b_id" {
#   value = "subnet-01f0757b77ef3d4e1"
# }

# output "subnet_utility-eu-west-1c_id" {
#   value = "subnet-0543b5d10bd887a5b"
# }

# output "vpc_id" {
#   value = "vpc-07c93b78357bb8450"
# }

# provider "aws" {
#   region = "eu-west-1"
# }

resource "aws_autoscaling_attachment" "bastions-vault-demo-useless-mobi" {
  elb                    = "${aws_elb.bastion-vault-demo-useless-mobi.id}"
  autoscaling_group_name = "${aws_autoscaling_group.bastions-vault-demo-useless-mobi.id}"
}

resource "aws_autoscaling_attachment" "master-eu-west-1a-masters-vault-demo-useless-mobi" {
  elb                    = "${aws_elb.api-vault-demo-useless-mobi.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-eu-west-1a-masters-vault-demo-useless-mobi.id}"
}

resource "aws_autoscaling_attachment" "master-eu-west-1b-masters-vault-demo-useless-mobi" {
  elb                    = "${aws_elb.api-vault-demo-useless-mobi.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-eu-west-1b-masters-vault-demo-useless-mobi.id}"
}

resource "aws_autoscaling_attachment" "master-eu-west-1c-masters-vault-demo-useless-mobi" {
  elb                    = "${aws_elb.api-vault-demo-useless-mobi.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-eu-west-1c-masters-vault-demo-useless-mobi.id}"
}

resource "aws_autoscaling_group" "bastions-vault-demo-useless-mobi" {
  name                 = "bastions.vault-demo.useless.mobi"
  launch_configuration = "${aws_launch_configuration.bastions-vault-demo-useless-mobi.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["subnet-093e9b3ab369ce081", "subnet-01f0757b77ef3d4e1", "subnet-0543b5d10bd887a5b"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "vault-demo.useless.mobi"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "bastions.vault-demo.useless.mobi"
    propagate_at_launch = true
  }

  tag = {
    key                 = "environment"
    value               = "dev"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "bastions"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/bastion"
    value               = "1"
    propagate_at_launch = true
  }

  tag = {
    key                 = "kubernetes.io/cluster/vault-demo.useless.mobi"
    value               = "shared"
    propagate_at_launch = true
  }

  tag = {
    key                 = "project"
    value               = "vault-demo"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-eu-west-1a-masters-vault-demo-useless-mobi" {
  name                 = "master-eu-west-1a.masters.vault-demo.useless.mobi"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1a-masters-vault-demo-useless-mobi.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["subnet-0f34944d2f036c22b"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "vault-demo.useless.mobi"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1a.masters.vault-demo.useless.mobi"
    propagate_at_launch = true
  }

  tag = {
    key                 = "environment"
    value               = "dev"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-eu-west-1a"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  tag = {
    key                 = "kubernetes.io/cluster/vault-demo.useless.mobi"
    value               = "shared"
    propagate_at_launch = true
  }

  tag = {
    key                 = "project"
    value               = "vault-demo"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-eu-west-1b-masters-vault-demo-useless-mobi" {
  name                 = "master-eu-west-1b.masters.vault-demo.useless.mobi"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1b-masters-vault-demo-useless-mobi.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["subnet-06b1d6094b71fed3d"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "vault-demo.useless.mobi"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1b.masters.vault-demo.useless.mobi"
    propagate_at_launch = true
  }

  tag = {
    key                 = "environment"
    value               = "dev"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-eu-west-1b"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  tag = {
    key                 = "kubernetes.io/cluster/vault-demo.useless.mobi"
    value               = "shared"
    propagate_at_launch = true
  }

  tag = {
    key                 = "project"
    value               = "vault-demo"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-eu-west-1c-masters-vault-demo-useless-mobi" {
  name                 = "master-eu-west-1c.masters.vault-demo.useless.mobi"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1c-masters-vault-demo-useless-mobi.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["subnet-0a2497254954840d4"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "vault-demo.useless.mobi"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1c.masters.vault-demo.useless.mobi"
    propagate_at_launch = true
  }

  tag = {
    key                 = "environment"
    value               = "dev"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-eu-west-1c"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  tag = {
    key                 = "kubernetes.io/cluster/vault-demo.useless.mobi"
    value               = "shared"
    propagate_at_launch = true
  }

  tag = {
    key                 = "project"
    value               = "vault-demo"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "nodes-vault-demo-useless-mobi" {
  name                 = "nodes.vault-demo.useless.mobi"
  launch_configuration = "${aws_launch_configuration.nodes-vault-demo-useless-mobi.id}"
  max_size             = 3
  min_size             = 3
  vpc_zone_identifier  = ["subnet-0f34944d2f036c22b", "subnet-06b1d6094b71fed3d", "subnet-0a2497254954840d4"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "vault-demo.useless.mobi"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.vault-demo.useless.mobi"
    propagate_at_launch = true
  }

  tag = {
    key                 = "environment"
    value               = "dev"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "nodes"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }

  tag = {
    key                 = "kubernetes.io/cluster/vault-demo.useless.mobi"
    value               = "shared"
    propagate_at_launch = true
  }

  tag = {
    key                 = "project"
    value               = "vault-demo"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_ebs_volume" "a-etcd-events-vault-demo-useless-mobi" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                               = "vault-demo.useless.mobi"
    Name                                            = "a.etcd-events.vault-demo.useless.mobi"
    environment                                     = "dev"
    "k8s.io/etcd/events"                            = "a/a,b,c"
    "k8s.io/role/master"                            = "1"
    "kubernetes.io/cluster/vault-demo.useless.mobi" = "owned"
    project                                         = "vault-demo"
  }
}

resource "aws_ebs_volume" "a-etcd-main-vault-demo-useless-mobi" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                               = "vault-demo.useless.mobi"
    Name                                            = "a.etcd-main.vault-demo.useless.mobi"
    environment                                     = "dev"
    "k8s.io/etcd/main"                              = "a/a,b,c"
    "k8s.io/role/master"                            = "1"
    "kubernetes.io/cluster/vault-demo.useless.mobi" = "owned"
    project                                         = "vault-demo"
  }
}

resource "aws_ebs_volume" "b-etcd-events-vault-demo-useless-mobi" {
  availability_zone = "eu-west-1b"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                               = "vault-demo.useless.mobi"
    Name                                            = "b.etcd-events.vault-demo.useless.mobi"
    environment                                     = "dev"
    "k8s.io/etcd/events"                            = "b/a,b,c"
    "k8s.io/role/master"                            = "1"
    "kubernetes.io/cluster/vault-demo.useless.mobi" = "owned"
    project                                         = "vault-demo"
  }
}

resource "aws_ebs_volume" "b-etcd-main-vault-demo-useless-mobi" {
  availability_zone = "eu-west-1b"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                               = "vault-demo.useless.mobi"
    Name                                            = "b.etcd-main.vault-demo.useless.mobi"
    environment                                     = "dev"
    "k8s.io/etcd/main"                              = "b/a,b,c"
    "k8s.io/role/master"                            = "1"
    "kubernetes.io/cluster/vault-demo.useless.mobi" = "owned"
    project                                         = "vault-demo"
  }
}

resource "aws_ebs_volume" "c-etcd-events-vault-demo-useless-mobi" {
  availability_zone = "eu-west-1c"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                               = "vault-demo.useless.mobi"
    Name                                            = "c.etcd-events.vault-demo.useless.mobi"
    environment                                     = "dev"
    "k8s.io/etcd/events"                            = "c/a,b,c"
    "k8s.io/role/master"                            = "1"
    "kubernetes.io/cluster/vault-demo.useless.mobi" = "owned"
    project                                         = "vault-demo"
  }
}

resource "aws_ebs_volume" "c-etcd-main-vault-demo-useless-mobi" {
  availability_zone = "eu-west-1c"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                               = "vault-demo.useless.mobi"
    Name                                            = "c.etcd-main.vault-demo.useless.mobi"
    environment                                     = "dev"
    "k8s.io/etcd/main"                              = "c/a,b,c"
    "k8s.io/role/master"                            = "1"
    "kubernetes.io/cluster/vault-demo.useless.mobi" = "owned"
    project                                         = "vault-demo"
  }
}

resource "aws_elb" "api-vault-demo-useless-mobi" {
  name = "api-vault-demo-useless-mo-t4scrs"

  listener = {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.api-elb-vault-demo-useless-mobi.id}"]
  subnets         = ["subnet-01f0757b77ef3d4e1", "subnet-0543b5d10bd887a5b", "subnet-093e9b3ab369ce081"]

  health_check = {
    target              = "SSL:443"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "vault-demo.useless.mobi"
    Name              = "api.vault-demo.useless.mobi"
  }
}

resource "aws_elb" "bastion-vault-demo-useless-mobi" {
  name = "bastion-vault-demo-useles-a81072"

  listener = {
    instance_port     = 22
    instance_protocol = "TCP"
    lb_port           = 22
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.bastion-elb-vault-demo-useless-mobi.id}"]
  subnets         = ["subnet-01f0757b77ef3d4e1", "subnet-0543b5d10bd887a5b", "subnet-093e9b3ab369ce081"]

  health_check = {
    target              = "TCP:22"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "vault-demo.useless.mobi"
    Name              = "bastion.vault-demo.useless.mobi"
  }
}

resource "aws_iam_instance_profile" "bastions-vault-demo-useless-mobi" {
  name = "bastions.vault-demo.useless.mobi"
  role = "${aws_iam_role.bastions-vault-demo-useless-mobi.name}"
}

resource "aws_iam_instance_profile" "masters-vault-demo-useless-mobi" {
  name = "masters.vault-demo.useless.mobi"
  role = "${aws_iam_role.masters-vault-demo-useless-mobi.name}"
}

resource "aws_iam_instance_profile" "nodes-vault-demo-useless-mobi" {
  name = "nodes.vault-demo.useless.mobi"
  role = "${aws_iam_role.nodes-vault-demo-useless-mobi.name}"
}

resource "aws_iam_role" "bastions-vault-demo-useless-mobi" {
  name               = "bastions.vault-demo.useless.mobi"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_bastions.vault-demo.useless.mobi_policy")}"
}

resource "aws_iam_role" "masters-vault-demo-useless-mobi" {
  name               = "masters.vault-demo.useless.mobi"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.vault-demo.useless.mobi_policy")}"
}

resource "aws_iam_role" "nodes-vault-demo-useless-mobi" {
  name               = "nodes.vault-demo.useless.mobi"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.vault-demo.useless.mobi_policy")}"
}

resource "aws_iam_role_policy" "bastions-vault-demo-useless-mobi" {
  name   = "bastions.vault-demo.useless.mobi"
  role   = "${aws_iam_role.bastions-vault-demo-useless-mobi.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_bastions.vault-demo.useless.mobi_policy")}"
}

resource "aws_iam_role_policy" "masters-vault-demo-useless-mobi" {
  name   = "masters.vault-demo.useless.mobi"
  role   = "${aws_iam_role.masters-vault-demo-useless-mobi.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.vault-demo.useless.mobi_policy")}"
}

resource "aws_iam_role_policy" "nodes-vault-demo-useless-mobi" {
  name   = "nodes.vault-demo.useless.mobi"
  role   = "${aws_iam_role.nodes-vault-demo-useless-mobi.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.vault-demo.useless.mobi_policy")}"
}

resource "aws_key_pair" "kubernetes-vault-demo-useless-mobi-5341b5348350195184b15694b746e1f4" {
  key_name   = "kubernetes.vault-demo.useless.mobi-53:41:b5:34:83:50:19:51:84:b1:56:94:b7:46:e1:f4"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.vault-demo.useless.mobi-5341b5348350195184b15694b746e1f4_public_key")}"
}

resource "aws_launch_configuration" "bastions-vault-demo-useless-mobi" {
  name_prefix                 = "bastions.vault-demo.useless.mobi-"
  image_id                    = "ami-01666ac8d55438d0b"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-vault-demo-useless-mobi-5341b5348350195184b15694b746e1f4.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.bastions-vault-demo-useless-mobi.id}"
  security_groups             = ["${aws_security_group.bastion-vault-demo-useless-mobi.id}"]
  associate_public_ip_address = true

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 32
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-eu-west-1a-masters-vault-demo-useless-mobi" {
  name_prefix                 = "master-eu-west-1a.masters.vault-demo.useless.mobi-"
  image_id                    = "ami-01666ac8d55438d0b"
  instance_type               = "t2.medium"
  key_name                    = "${aws_key_pair.kubernetes-vault-demo-useless-mobi-5341b5348350195184b15694b746e1f4.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-vault-demo-useless-mobi.id}"
  security_groups             = ["${aws_security_group.masters-vault-demo-useless-mobi.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1a.masters.vault-demo.useless.mobi_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  placement_tenancy = "default"
  enable_monitoring = false
}

resource "aws_launch_configuration" "master-eu-west-1b-masters-vault-demo-useless-mobi" {
  name_prefix                 = "master-eu-west-1b.masters.vault-demo.useless.mobi-"
  image_id                    = "ami-01666ac8d55438d0b"
  instance_type               = "t2.medium"
  key_name                    = "${aws_key_pair.kubernetes-vault-demo-useless-mobi-5341b5348350195184b15694b746e1f4.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-vault-demo-useless-mobi.id}"
  security_groups             = ["${aws_security_group.masters-vault-demo-useless-mobi.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1b.masters.vault-demo.useless.mobi_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  placement_tenancy = "default"
  enable_monitoring = false
}

resource "aws_launch_configuration" "master-eu-west-1c-masters-vault-demo-useless-mobi" {
  name_prefix                 = "master-eu-west-1c.masters.vault-demo.useless.mobi-"
  image_id                    = "ami-01666ac8d55438d0b"
  instance_type               = "t2.medium"
  key_name                    = "${aws_key_pair.kubernetes-vault-demo-useless-mobi-5341b5348350195184b15694b746e1f4.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-vault-demo-useless-mobi.id}"
  security_groups             = ["${aws_security_group.masters-vault-demo-useless-mobi.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1c.masters.vault-demo.useless.mobi_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  placement_tenancy = "default"
  enable_monitoring = false
}

resource "aws_launch_configuration" "nodes-vault-demo-useless-mobi" {
  name_prefix                 = "nodes.vault-demo.useless.mobi-"
  image_id                    = "ami-01666ac8d55438d0b"
  instance_type               = "t2.medium"
  key_name                    = "${aws_key_pair.kubernetes-vault-demo-useless-mobi-5341b5348350195184b15694b746e1f4.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-vault-demo-useless-mobi.id}"
  security_groups             = ["${aws_security_group.nodes-vault-demo-useless-mobi.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.vault-demo.useless.mobi_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 128
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  placement_tenancy = "default"
  enable_monitoring = false
}

resource "aws_route53_record" "api-vault-demo-useless-mobi" {
  name = "api.vault-demo.useless.mobi"
  type = "A"

  alias = {
    name                   = "${aws_elb.api-vault-demo-useless-mobi.dns_name}"
    zone_id                = "${aws_elb.api-vault-demo-useless-mobi.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z1ID1FNQKMNYW4"
}

resource "aws_route53_record" "bastion-vault-demo-useless-mobi" {
  name = "bastion.vault-demo.useless.mobi"
  type = "A"

  alias = {
    name                   = "${aws_elb.bastion-vault-demo-useless-mobi.dns_name}"
    zone_id                = "${aws_elb.bastion-vault-demo-useless-mobi.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z1ID1FNQKMNYW4"
}

resource "aws_security_group" "api-elb-vault-demo-useless-mobi" {
  name        = "api-elb.vault-demo.useless.mobi"
  vpc_id      = "vpc-07c93b78357bb8450"
  description = "Security group for api ELB"

  tags = {
    KubernetesCluster                               = "vault-demo.useless.mobi"
    Name                                            = "api-elb.vault-demo.useless.mobi"
    "kubernetes.io/cluster/vault-demo.useless.mobi" = "owned"
  }
}

resource "aws_security_group" "bastion-elb-vault-demo-useless-mobi" {
  name        = "bastion-elb.vault-demo.useless.mobi"
  vpc_id      = "vpc-07c93b78357bb8450"
  description = "Security group for bastion ELB"

  tags = {
    KubernetesCluster                               = "vault-demo.useless.mobi"
    Name                                            = "bastion-elb.vault-demo.useless.mobi"
    "kubernetes.io/cluster/vault-demo.useless.mobi" = "owned"
  }
}

resource "aws_security_group" "bastion-vault-demo-useless-mobi" {
  name        = "bastion.vault-demo.useless.mobi"
  vpc_id      = "vpc-07c93b78357bb8450"
  description = "Security group for bastion"

  tags = {
    KubernetesCluster                               = "vault-demo.useless.mobi"
    Name                                            = "bastion.vault-demo.useless.mobi"
    "kubernetes.io/cluster/vault-demo.useless.mobi" = "owned"
  }
}

resource "aws_security_group" "masters-vault-demo-useless-mobi" {
  name        = "masters.vault-demo.useless.mobi"
  vpc_id      = "vpc-07c93b78357bb8450"
  description = "Security group for masters"

  tags = {
    KubernetesCluster                               = "vault-demo.useless.mobi"
    Name                                            = "masters.vault-demo.useless.mobi"
    "kubernetes.io/cluster/vault-demo.useless.mobi" = "owned"
  }
}

resource "aws_security_group" "nodes-vault-demo-useless-mobi" {
  name        = "nodes.vault-demo.useless.mobi"
  vpc_id      = "vpc-07c93b78357bb8450"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster                               = "vault-demo.useless.mobi"
    Name                                            = "nodes.vault-demo.useless.mobi"
    "kubernetes.io/cluster/vault-demo.useless.mobi" = "owned"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-vault-demo-useless-mobi.id}"
  source_security_group_id = "${aws_security_group.masters-vault-demo-useless-mobi.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-vault-demo-useless-mobi.id}"
  source_security_group_id = "${aws_security_group.masters-vault-demo-useless-mobi.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-vault-demo-useless-mobi.id}"
  source_security_group_id = "${aws_security_group.nodes-vault-demo-useless-mobi.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "api-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.api-elb-vault-demo-useless-mobi.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-vault-demo-useless-mobi.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-elb-vault-demo-useless-mobi.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-to-master-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-vault-demo-useless-mobi.id}"
  source_security_group_id = "${aws_security_group.bastion-vault-demo-useless-mobi.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "bastion-to-node-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-vault-demo-useless-mobi.id}"
  source_security_group_id = "${aws_security_group.bastion-vault-demo-useless-mobi.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "https-api-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.api-elb-vault-demo-useless-mobi.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-elb-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-vault-demo-useless-mobi.id}"
  source_security_group_id = "${aws_security_group.api-elb-vault-demo-useless-mobi.id}"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
}
resource "aws_security_group_rule" "https-vault-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-vault-demo-useless-mobi.id}"
  source_security_group_id = "${module.vault_cluster.security_group_id}"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-vault-demo-useless-mobi.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-vault-demo-useless-mobi.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-vault-demo-useless-mobi.id}"
  source_security_group_id = "${aws_security_group.nodes-vault-demo-useless-mobi.id}"
  from_port                = 1
  to_port                  = 2379
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4000" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-vault-demo-useless-mobi.id}"
  source_security_group_id = "${aws_security_group.nodes-vault-demo-useless-mobi.id}"
  from_port                = 2382
  to_port                  = 4000
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-vault-demo-useless-mobi.id}"
  source_security_group_id = "${aws_security_group.nodes-vault-demo-useless-mobi.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-vault-demo-useless-mobi.id}"
  source_security_group_id = "${aws_security_group.nodes-vault-demo-useless-mobi.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-elb-to-bastion" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.bastion-vault-demo-useless-mobi.id}"
  source_security_group_id = "${aws_security_group.bastion-elb-vault-demo-useless-mobi.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "ssh-external-to-bastion-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.bastion-elb-vault-demo-useless-mobi.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

terraform = {
  required_version = ">= 0.9.3"
}
