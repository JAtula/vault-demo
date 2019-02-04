locals = {
  bastion_autoscaling_group_ids = ["${aws_autoscaling_group.bastions-vault-demo-mecloud-online.id}"]
  bastion_security_group_ids    = ["${aws_security_group.bastion-vault-demo-mecloud-online.id}"]
  bastions_role_arn             = "${aws_iam_role.bastions-vault-demo-mecloud-online.arn}"
  bastions_role_name            = "${aws_iam_role.bastions-vault-demo-mecloud-online.name}"
  cluster_name                  = "vault-demo.mecloud.online"
  master_autoscaling_group_ids  = ["${aws_autoscaling_group.master-eu-west-1a-masters-vault-demo-mecloud-online.id}", "${aws_autoscaling_group.master-eu-west-1b-masters-vault-demo-mecloud-online.id}", "${aws_autoscaling_group.master-eu-west-1c-masters-vault-demo-mecloud-online.id}"]
  master_security_group_ids     = ["${aws_security_group.masters-vault-demo-mecloud-online.id}"]
  masters_role_arn              = "${aws_iam_role.masters-vault-demo-mecloud-online.arn}"
  masters_role_name             = "${aws_iam_role.masters-vault-demo-mecloud-online.name}"
  node_autoscaling_group_ids    = ["${aws_autoscaling_group.nodes-vault-demo-mecloud-online.id}"]
  node_security_group_ids       = ["${aws_security_group.nodes-vault-demo-mecloud-online.id}"]
  node_subnet_ids               = ["${data.aws_subnet_ids.private_subnet_ids.ids}"]
  utility_subnet_ids            = ["${data.aws_subnet_ids.utility_subnet_ids.ids}"]
  nodes_role_arn                = "${aws_iam_role.nodes-vault-demo-mecloud-online.arn}"
  nodes_role_name               = "${aws_iam_role.nodes-vault-demo-mecloud-online.name}"
  region                        = "eu-west-1"
  subnet_eu-west-1a_id          = "${element(aws_subnet.private.*.id, 0)}"
  subnet_eu-west-1b_id          = "${element(aws_subnet.private.*.id, 1)}"
  subnet_eu-west-1c_id          = "${element(aws_subnet.private.*.id, 2)}"
  subnet_ids                    = ["${data.aws_subnet_ids.all_subnets.ids}"]
  subnet_utility-eu-west-1a_id  = "${element(aws_subnet.utility.*.id, 0)}"
  subnet_utility-eu-west-1b_id  = "${element(aws_subnet.utility.*.id, 1)}"
  subnet_utility-eu-west-1c_id  = "${element(aws_subnet.utility.*.id, 2)}"
  vpc_id                        = "${aws_vpc.main.id}"
}

output "bastion_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.bastions-vault-demo-mecloud-online.id}"]
}

output "bastion_security_group_ids" {
  value = ["${aws_security_group.bastion-vault-demo-mecloud-online.id}"]
}

output "bastions_role_arn" {
  value = "${aws_iam_role.bastions-vault-demo-mecloud-online.arn}"
}

output "bastions_role_name" {
  value = "${aws_iam_role.bastions-vault-demo-mecloud-online.name}"
}

output "cluster_name" {
  value = "vault-demo.mecloud.online"
}

output "master_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.master-eu-west-1a-masters-vault-demo-mecloud-online.id}", "${aws_autoscaling_group.master-eu-west-1b-masters-vault-demo-mecloud-online.id}", "${aws_autoscaling_group.master-eu-west-1c-masters-vault-demo-mecloud-online.id}"]
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-vault-demo-mecloud-online.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-vault-demo-mecloud-online.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-vault-demo-mecloud-online.name}"
}

output "node_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.nodes-vault-demo-mecloud-online.id}"]
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-vault-demo-mecloud-online.id}"]
}


output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-vault-demo-mecloud-online.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-vault-demo-mecloud-online.name}"
}

output "region" {
  value = "eu-west-1"
}

# output "node_subnet_ids" {
#   value = ["subnet-004f1a62b1f60a0c1", "subnet-00cc5bf7d76c69ac2", "subnet-066ba15732a54bb9c"]
# }

# output "subnet_eu-west-1a_id" {
#   value = "subnet-00cc5bf7d76c69ac2"
# }

# output "subnet_eu-west-1b_id" {
#   value = "subnet-066ba15732a54bb9c"
# }

# output "subnet_eu-west-1c_id" {
#   value = "subnet-004f1a62b1f60a0c1"
# }

# output "subnet_ids" {
#   value = ["subnet-004f1a62b1f60a0c1", "subnet-00cc5bf7d76c69ac2", "subnet-066ba15732a54bb9c", "subnet-0837038830e4c17e0", "subnet-0a20b72ddb45221ac", "subnet-0bac9655b5022e26d"]
# }

# output "subnet_utility-eu-west-1a_id" {
#   value = "subnet-0837038830e4c17e0"
# }

# output "subnet_utility-eu-west-1b_id" {
#   value = "subnet-0a20b72ddb45221ac"
# }

# output "subnet_utility-eu-west-1c_id" {
#   value = "subnet-0bac9655b5022e26d"
# }

# output "vpc_id" {
#   value = "${aws_vpc.main.id}"
# }

# provider "aws" {
#   region = "eu-west-1"
# }

resource "aws_autoscaling_attachment" "bastions-vault-demo-mecloud-online" {
  elb                    = "${aws_elb.bastion-vault-demo-mecloud-online.id}"
  autoscaling_group_name = "${aws_autoscaling_group.bastions-vault-demo-mecloud-online.id}"
}

resource "aws_autoscaling_attachment" "master-eu-west-1a-masters-vault-demo-mecloud-online" {
  elb                    = "${aws_elb.api-vault-demo-mecloud-online.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-eu-west-1a-masters-vault-demo-mecloud-online.id}"
}

resource "aws_autoscaling_attachment" "master-eu-west-1b-masters-vault-demo-mecloud-online" {
  elb                    = "${aws_elb.api-vault-demo-mecloud-online.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-eu-west-1b-masters-vault-demo-mecloud-online.id}"
}

resource "aws_autoscaling_attachment" "master-eu-west-1c-masters-vault-demo-mecloud-online" {
  elb                    = "${aws_elb.api-vault-demo-mecloud-online.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-eu-west-1c-masters-vault-demo-mecloud-online.id}"
}

resource "aws_autoscaling_group" "bastions-vault-demo-mecloud-online" {
  name                 = "bastions.vault-demo.mecloud.online"
  launch_configuration = "${aws_launch_configuration.bastions-vault-demo-mecloud-online.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${local.utility_subnet_ids}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "vault-demo.mecloud.online"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "bastions.vault-demo.mecloud.online"
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
    key                 = "kubernetes.io/cluster/vault-demo.mecloud.online"
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

resource "aws_autoscaling_group" "master-eu-west-1a-masters-vault-demo-mecloud-online" {
  name                 = "master-eu-west-1a.masters.vault-demo.mecloud.online"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1a-masters-vault-demo-mecloud-online.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${local.subnet_utility-eu-west-1a_id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "vault-demo.mecloud.online"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1a.masters.vault-demo.mecloud.online"
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
    key                 = "kubernetes.io/cluster/vault-demo.mecloud.online"
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

resource "aws_autoscaling_group" "master-eu-west-1b-masters-vault-demo-mecloud-online" {
  name                 = "master-eu-west-1b.masters.vault-demo.mecloud.online"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1b-masters-vault-demo-mecloud-online.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${local.subnet_utility-eu-west-1b_id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "vault-demo.mecloud.online"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1b.masters.vault-demo.mecloud.online"
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
    key                 = "kubernetes.io/cluster/vault-demo.mecloud.online"
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

resource "aws_autoscaling_group" "master-eu-west-1c-masters-vault-demo-mecloud-online" {
  name                 = "master-eu-west-1c.masters.vault-demo.mecloud.online"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1c-masters-vault-demo-mecloud-online.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${local.subnet_utility-eu-west-1c_id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "vault-demo.mecloud.online"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1c.masters.vault-demo.mecloud.online"
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
    key                 = "kubernetes.io/cluster/vault-demo.mecloud.online"
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

resource "aws_autoscaling_group" "nodes-vault-demo-mecloud-online" {
  name                 = "nodes.vault-demo.mecloud.online"
  launch_configuration = "${aws_launch_configuration.nodes-vault-demo-mecloud-online.id}"
  max_size             = 3
  min_size             = 3
  vpc_zone_identifier  = ["${local.node_subnet_ids}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "vault-demo.mecloud.online"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.vault-demo.mecloud.online"
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
    key                 = "kubernetes.io/cluster/vault-demo.mecloud.online"
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

resource "aws_ebs_volume" "a-etcd-events-vault-demo-mecloud-online" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                                 = "vault-demo.mecloud.online"
    Name                                              = "a.etcd-events.vault-demo.mecloud.online"
    environment                                       = "dev"
    "k8s.io/etcd/events"                              = "a/a,b,c"
    "k8s.io/role/master"                              = "1"
    "kubernetes.io/cluster/vault-demo.mecloud.online" = "owned"
    project                                           = "vault-demo"
  }
}

resource "aws_ebs_volume" "a-etcd-main-vault-demo-mecloud-online" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                                 = "vault-demo.mecloud.online"
    Name                                              = "a.etcd-main.vault-demo.mecloud.online"
    environment                                       = "dev"
    "k8s.io/etcd/main"                                = "a/a,b,c"
    "k8s.io/role/master"                              = "1"
    "kubernetes.io/cluster/vault-demo.mecloud.online" = "owned"
    project                                           = "vault-demo"
  }
}

resource "aws_ebs_volume" "b-etcd-events-vault-demo-mecloud-online" {
  availability_zone = "eu-west-1b"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                                 = "vault-demo.mecloud.online"
    Name                                              = "b.etcd-events.vault-demo.mecloud.online"
    environment                                       = "dev"
    "k8s.io/etcd/events"                              = "b/a,b,c"
    "k8s.io/role/master"                              = "1"
    "kubernetes.io/cluster/vault-demo.mecloud.online" = "owned"
    project                                           = "vault-demo"
  }
}

resource "aws_ebs_volume" "b-etcd-main-vault-demo-mecloud-online" {
  availability_zone = "eu-west-1b"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                                 = "vault-demo.mecloud.online"
    Name                                              = "b.etcd-main.vault-demo.mecloud.online"
    environment                                       = "dev"
    "k8s.io/etcd/main"                                = "b/a,b,c"
    "k8s.io/role/master"                              = "1"
    "kubernetes.io/cluster/vault-demo.mecloud.online" = "owned"
    project                                           = "vault-demo"
  }
}

resource "aws_ebs_volume" "c-etcd-events-vault-demo-mecloud-online" {
  availability_zone = "eu-west-1c"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                                 = "vault-demo.mecloud.online"
    Name                                              = "c.etcd-events.vault-demo.mecloud.online"
    environment                                       = "dev"
    "k8s.io/etcd/events"                              = "c/a,b,c"
    "k8s.io/role/master"                              = "1"
    "kubernetes.io/cluster/vault-demo.mecloud.online" = "owned"
    project                                           = "vault-demo"
  }
}

resource "aws_ebs_volume" "c-etcd-main-vault-demo-mecloud-online" {
  availability_zone = "eu-west-1c"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                                 = "vault-demo.mecloud.online"
    Name                                              = "c.etcd-main.vault-demo.mecloud.online"
    environment                                       = "dev"
    "k8s.io/etcd/main"                                = "c/a,b,c"
    "k8s.io/role/master"                              = "1"
    "kubernetes.io/cluster/vault-demo.mecloud.online" = "owned"
    project                                           = "vault-demo"
  }
}

resource "aws_elb" "api-vault-demo-mecloud-online" {
  name = "api-vault-demo-mecloud-on-l8p1kc"

  listener = {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.api-elb-vault-demo-mecloud-online.id}"]
  subnets         = ["${local.utility_subnet_ids}"]

  health_check = {
    target              = "SSL:443"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "vault-demo.mecloud.online"
    Name              = "api.vault-demo.mecloud.online"
  }
}

resource "aws_elb" "bastion-vault-demo-mecloud-online" {
  name = "bastion-vault-demo-meclou-6eise2"

  listener = {
    instance_port     = 22
    instance_protocol = "TCP"
    lb_port           = 22
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.bastion-elb-vault-demo-mecloud-online.id}"]
  subnets         = ["${local.utility_subnet_ids}"]

  health_check = {
    target              = "TCP:22"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "vault-demo.mecloud.online"
    Name              = "bastion.vault-demo.mecloud.online"
  }
}

resource "aws_iam_instance_profile" "bastions-vault-demo-mecloud-online" {
  name = "bastions.vault-demo.mecloud.online"
  role = "${aws_iam_role.bastions-vault-demo-mecloud-online.name}"
}

resource "aws_iam_instance_profile" "masters-vault-demo-mecloud-online" {
  name = "masters.vault-demo.mecloud.online"
  role = "${aws_iam_role.masters-vault-demo-mecloud-online.name}"
}

resource "aws_iam_instance_profile" "nodes-vault-demo-mecloud-online" {
  name = "nodes.vault-demo.mecloud.online"
  role = "${aws_iam_role.nodes-vault-demo-mecloud-online.name}"
}

resource "aws_iam_role" "bastions-vault-demo-mecloud-online" {
  name               = "bastions.vault-demo.mecloud.online"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_bastions.vault-demo.mecloud.online_policy")}"
}

resource "aws_iam_role" "masters-vault-demo-mecloud-online" {
  name               = "masters.vault-demo.mecloud.online"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.vault-demo.mecloud.online_policy")}"
}

resource "aws_iam_role" "nodes-vault-demo-mecloud-online" {
  name               = "nodes.vault-demo.mecloud.online"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.vault-demo.mecloud.online_policy")}"
}

resource "aws_iam_role_policy" "bastions-vault-demo-mecloud-online" {
  name   = "bastions.vault-demo.mecloud.online"
  role   = "${aws_iam_role.bastions-vault-demo-mecloud-online.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_bastions.vault-demo.mecloud.online_policy")}"
}

resource "aws_iam_role_policy" "masters-vault-demo-mecloud-online" {
  name   = "masters.vault-demo.mecloud.online"
  role   = "${aws_iam_role.masters-vault-demo-mecloud-online.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.vault-demo.mecloud.online_policy")}"
}

resource "aws_iam_role_policy" "nodes-vault-demo-mecloud-online" {
  name   = "nodes.vault-demo.mecloud.online"
  role   = "${aws_iam_role.nodes-vault-demo-mecloud-online.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.vault-demo.mecloud.online_policy")}"
}

resource "aws_key_pair" "kubernetes-vault-demo-mecloud-online-51ec52fa2c81518055983cf734af87ca" {
  key_name   = "kubernetes.vault-demo.mecloud.online-51:ec:52:fa:2c:81:51:80:55:98:3c:f7:34:af:87:ca"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.vault-demo.mecloud.online-51ec52fa2c81518055983cf734af87ca_public_key")}"
}

resource "aws_launch_configuration" "bastions-vault-demo-mecloud-online" {
  name_prefix                 = "bastions.vault-demo.mecloud.online-"
  image_id                    = "ami-01666ac8d55438d0b"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-vault-demo-mecloud-online-51ec52fa2c81518055983cf734af87ca.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.bastions-vault-demo-mecloud-online.id}"
  security_groups             = ["${aws_security_group.bastion-vault-demo-mecloud-online.id}"]
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

resource "aws_launch_configuration" "master-eu-west-1a-masters-vault-demo-mecloud-online" {
  name_prefix                 = "master-eu-west-1a.masters.vault-demo.mecloud.online-"
  image_id                    = "ami-01666ac8d55438d0b"
  instance_type               = "t2.medium"
  key_name                    = "${aws_key_pair.kubernetes-vault-demo-mecloud-online-51ec52fa2c81518055983cf734af87ca.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-vault-demo-mecloud-online.id}"
  security_groups             = ["${aws_security_group.masters-vault-demo-mecloud-online.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1a.masters.vault-demo.mecloud.online_user_data")}"

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

resource "aws_launch_configuration" "master-eu-west-1b-masters-vault-demo-mecloud-online" {
  name_prefix                 = "master-eu-west-1b.masters.vault-demo.mecloud.online-"
  image_id                    = "ami-01666ac8d55438d0b"
  instance_type               = "t2.medium"
  key_name                    = "${aws_key_pair.kubernetes-vault-demo-mecloud-online-51ec52fa2c81518055983cf734af87ca.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-vault-demo-mecloud-online.id}"
  security_groups             = ["${aws_security_group.masters-vault-demo-mecloud-online.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1b.masters.vault-demo.mecloud.online_user_data")}"

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

resource "aws_launch_configuration" "master-eu-west-1c-masters-vault-demo-mecloud-online" {
  name_prefix                 = "master-eu-west-1c.masters.vault-demo.mecloud.online-"
  image_id                    = "ami-01666ac8d55438d0b"
  instance_type               = "t2.medium"
  key_name                    = "${aws_key_pair.kubernetes-vault-demo-mecloud-online-51ec52fa2c81518055983cf734af87ca.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-vault-demo-mecloud-online.id}"
  security_groups             = ["${aws_security_group.masters-vault-demo-mecloud-online.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1c.masters.vault-demo.mecloud.online_user_data")}"

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

resource "aws_launch_configuration" "nodes-vault-demo-mecloud-online" {
  name_prefix                 = "nodes.vault-demo.mecloud.online-"
  image_id                    = "ami-01666ac8d55438d0b"
  instance_type               = "t2.medium"
  key_name                    = "${aws_key_pair.kubernetes-vault-demo-mecloud-online-51ec52fa2c81518055983cf734af87ca.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-vault-demo-mecloud-online.id}"
  security_groups             = ["${aws_security_group.nodes-vault-demo-mecloud-online.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.vault-demo.mecloud.online_user_data")}"

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

resource "aws_route53_record" "api-vault-demo-mecloud-online" {
  name = "api.vault-demo.mecloud.online"
  type = "A"

  alias = {
    name                   = "${aws_elb.api-vault-demo-mecloud-online.dns_name}"
    zone_id                = "${aws_elb.api-vault-demo-mecloud-online.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z33FE3WYQVPES7"
}

resource "aws_route53_record" "bastion-vault-demo-mecloud-online" {
  name = "bastion.vault-demo.mecloud.online"
  type = "A"

  alias = {
    name                   = "${aws_elb.bastion-vault-demo-mecloud-online.dns_name}"
    zone_id                = "${aws_elb.bastion-vault-demo-mecloud-online.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z33FE3WYQVPES7"
}

resource "aws_security_group" "api-elb-vault-demo-mecloud-online" {
  name        = "api-elb.vault-demo.mecloud.online"
  vpc_id      = "${local.vpc_id}"
  description = "Security group for api ELB"

  tags = {
    KubernetesCluster                                 = "vault-demo.mecloud.online"
    Name                                              = "api-elb.vault-demo.mecloud.online"
    "kubernetes.io/cluster/vault-demo.mecloud.online" = "owned"
  }
}

resource "aws_security_group" "bastion-elb-vault-demo-mecloud-online" {
  name        = "bastion-elb.vault-demo.mecloud.online"
  vpc_id      = "${local.vpc_id}"
  description = "Security group for bastion ELB"

  tags = {
    KubernetesCluster                                 = "vault-demo.mecloud.online"
    Name                                              = "bastion-elb.vault-demo.mecloud.online"
    "kubernetes.io/cluster/vault-demo.mecloud.online" = "owned"
  }
}

resource "aws_security_group" "bastion-vault-demo-mecloud-online" {
  name        = "bastion.vault-demo.mecloud.online"
  vpc_id      = "${local.vpc_id}"
  description = "Security group for bastion"

  tags = {
    KubernetesCluster                                 = "vault-demo.mecloud.online"
    Name                                              = "bastion.vault-demo.mecloud.online"
    "kubernetes.io/cluster/vault-demo.mecloud.online" = "owned"
  }
}

resource "aws_security_group" "masters-vault-demo-mecloud-online" {
  name        = "masters.vault-demo.mecloud.online"
  vpc_id      = "${local.vpc_id}"
  description = "Security group for masters"

  tags = {
    KubernetesCluster                                 = "vault-demo.mecloud.online"
    Name                                              = "masters.vault-demo.mecloud.online"
    "kubernetes.io/cluster/vault-demo.mecloud.online" = "owned"
  }
}

resource "aws_security_group" "nodes-vault-demo-mecloud-online" {
  name        = "nodes.vault-demo.mecloud.online"
  vpc_id      = "${local.vpc_id}"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster                                 = "vault-demo.mecloud.online"
    Name                                              = "nodes.vault-demo.mecloud.online"
    "kubernetes.io/cluster/vault-demo.mecloud.online" = "owned"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-vault-demo-mecloud-online.id}"
  source_security_group_id = "${aws_security_group.masters-vault-demo-mecloud-online.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-vault-demo-mecloud-online.id}"
  source_security_group_id = "${aws_security_group.masters-vault-demo-mecloud-online.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-vault-demo-mecloud-online.id}"
  source_security_group_id = "${aws_security_group.nodes-vault-demo-mecloud-online.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "api-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.api-elb-vault-demo-mecloud-online.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-vault-demo-mecloud-online.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-elb-vault-demo-mecloud-online.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-to-master-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-vault-demo-mecloud-online.id}"
  source_security_group_id = "${aws_security_group.bastion-vault-demo-mecloud-online.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "bastion-to-node-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-vault-demo-mecloud-online.id}"
  source_security_group_id = "${aws_security_group.bastion-vault-demo-mecloud-online.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "https-api-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.api-elb-vault-demo-mecloud-online.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-elb-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-vault-demo-mecloud-online.id}"
  source_security_group_id = "${aws_security_group.api-elb-vault-demo-mecloud-online.id}"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-vault-demo-mecloud-online.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-vault-demo-mecloud-online.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-vault-demo-mecloud-online.id}"
  source_security_group_id = "${aws_security_group.nodes-vault-demo-mecloud-online.id}"
  from_port                = 1
  to_port                  = 2379
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4000" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-vault-demo-mecloud-online.id}"
  source_security_group_id = "${aws_security_group.nodes-vault-demo-mecloud-online.id}"
  from_port                = 2382
  to_port                  = 4000
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-vault-demo-mecloud-online.id}"
  source_security_group_id = "${aws_security_group.nodes-vault-demo-mecloud-online.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-vault-demo-mecloud-online.id}"
  source_security_group_id = "${aws_security_group.nodes-vault-demo-mecloud-online.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-elb-to-bastion" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.bastion-vault-demo-mecloud-online.id}"
  source_security_group_id = "${aws_security_group.bastion-elb-vault-demo-mecloud-online.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "ssh-external-to-bastion-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.bastion-elb-vault-demo-mecloud-online.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

terraform = {
  required_version = ">= 0.9.3"
}
