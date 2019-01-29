#Vars
variable "availability_zones" {
  default = {
    "0" = "eu-west-1a"
    "1" = "eu-west-1b"
    "2" = "eu-west-1c"
  }
}

# Main VPC
resource "aws_vpc" "main" {
  cidr_block = "90.80.0.0/21"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    AttachedVPC = "${aws_vpc.main.id}"
  }
}

# Private Subnets
resource "aws_subnet" "private" {
  count = 3
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "90.80.${count.index + 1}.0/24"
  availability_zone = "${lookup(var.availability_zones, count.index)}"

  tags = {
    SubnetType = "Private"
  }
}

# Utility subnets
resource "aws_subnet" "utility" {
  count = 3
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "90.80.${count.index + 4}.0/24"
  availability_zone = "${lookup(var.availability_zones, count.index)}"

  tags = {
    SubnetType = "Utility"
  }
}

# NAT GWs and EIPs
resource "aws_eip" "nat" {
  count = 3
  vpc      = true
}
resource "aws_nat_gateway" "nat-gw" {
  count = 3
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.private.*.id, count.index)}"

  tags = {
    AvailabilityZone = "${lookup(var.availability_zones, count.index)}"
  }
}