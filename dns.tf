variable "elb" {
  default = "a80619dfd2b9611e9a8610aa8683738e"
}

data "aws_elb" "hyperspace_svc_elb" {
  name = "${var.elb}"
}

data "aws_route53_zone" "main" {
  name         = "useless.mobi."
}
data "aws_instances" "vault-instances" {
  instance_tags = {
    Name = "vault-cluster-nodes"
  }
}

resource "aws_route53_record" "vault" {
  zone_id = "${data.aws_route53_zone.main.id}"
  name    = "vault"
  type    = "A"
  ttl     = "300"
  records = ["${data.aws_instances.vault-instances.private_ips}"]
}

resource "aws_route53_record" "hyperspace" {
  zone_id = "${data.aws_route53_zone.main.id}"
  name    = "game"
  type    = "A"
  alias {
    name                   = "${data.aws_elb.hyperspace_svc_elb.dns_name}"
    zone_id                = "${data.aws_elb.hyperspace_svc_elb.zone_id}"
    evaluate_target_health = true
  }
}