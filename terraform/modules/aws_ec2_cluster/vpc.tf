# data "aws_vpc" "vpc" {
#    filter {
#      name = "tag-key"
#      values = ["Name"]
#    }
#    filter {
#      name = "tag-value"
#      values = ["${var.vpc_name}"]
#    }
# }
resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "${var.cluster_name}"
  }
}

resource "aws_subnet" "us-west-2a" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "us-west-2a"
  cidr_block        = "10.0.1.0/24"
}

resource "aws_subnet" "us-west-2b" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "us-west-2b"
  cidr_block        = "10.0.2.0/24"
}

resource "aws_subnet" "us-west-2c" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "us-west-2c"
  cidr_block        = "10.0.3.0/24"
}
