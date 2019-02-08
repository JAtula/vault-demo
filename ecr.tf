resource "aws_ecr_repository" "repository" {
    name = "hyperspace"
}

output "hyperspace_rep_arn" {
  value = "${aws_ecr_repository.repository.arn}"
}
