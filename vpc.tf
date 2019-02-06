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

  tags {
    "kubernetes.io/cluster/vault-demo.useless.mobi" = "shared"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    AttachedVPC = "${aws_vpc.main.id}"
  }
}

output "vpc_id" {
  value = "${aws_vpc.main.id}"
}


# Private Subnets
resource "aws_subnet" "private" {
  count = 3
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "90.80.${count.index + 1}.0/24"
  availability_zone = "${lookup(var.availability_zones, count.index)}"

  tags = {
    "kubernetes.io/cluster/vault-demo.useless.mobi" = "shared"
    "kubernetes.io/role/internal-elb"      = "1"
    "SubnetType"                           = "Private"
  }
}

# Utility subnets
resource "aws_subnet" "utility" {
  count = 3
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "90.80.${count.index + 4}.0/24"
  availability_zone = "${lookup(var.availability_zones, count.index)}"

  tags = {
    "kubernetes.io/cluster/vault-demo.useless.mobi" = "shared"
    "kubernetes.io/role/elb"               = "1"
    "SubnetType"                           = "Utility"
  }
}

data "aws_subnet_ids" "utility_subnet_ids" {
  depends_on = ["aws_subnet.utility"]
  vpc_id = "${aws_vpc.main.id}"
  tags = {
    SubnetType = "Utility"
  }
}

output "utility_subnet_ids" {
  value = "${data.aws_subnet_ids.utility_subnet_ids.ids}"
}

data "aws_subnet_ids" "private_subnet_ids" {
  depends_on = ["aws_subnet.private"]
  vpc_id = "${aws_vpc.main.id}"
  tags = {
    SubnetType = "Private"
  }
}

output "private_subnet_ids" {
  value = "${data.aws_subnet_ids.private_subnet_ids.ids}"
}
data "aws_subnet_ids" "all_subnets" {
  depends_on = ["aws_subnet.private", "aws_subnet.utility"]
  vpc_id = "${aws_vpc.main.id}"
}

output "all_subnet_ids" {
  value = "${data.aws_subnet_ids.all_subnets.ids}"
}



# NAT GWs and EIPs
resource "aws_eip" "nat" {
  count = 3
  vpc      = true
}
resource "aws_nat_gateway" "nat-gw" {
  count = 3
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.utility.*.id, count.index)}"

  tags = {
    AvailabilityZone = "${lookup(var.availability_zones, count.index)}"
  }
}

# Route tables
resource "aws_route_table" "private" {
  count = 3
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${element(aws_nat_gateway.nat-gw.*.id, count.index)}"
  }

  tags = {
    Name = "private-rt-${lookup(var.availability_zones, count.index)}"
  }
}

resource "aws_route_table_association" "private" {
  count = 3
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}
resource "aws_route_table" "utility" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "utility-rt"
  }
}

resource "aws_route_table_association" "utility" {
  count = 3
  subnet_id      = "${element(aws_subnet.utility.*.id, count.index)}"
  route_table_id = "${aws_route_table.utility.id}"
}