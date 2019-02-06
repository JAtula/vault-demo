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