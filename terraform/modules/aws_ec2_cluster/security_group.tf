resource "aws_security_group" "nodes" {
  name        = "${var.cluster_name}_nodes_sg"
  # vpc_id      = data.aws_vpc.vpc.id
  vpc_id      = resource.aws_vpc.vpc.id
}

resource "aws_security_group_rule" "outbound_traffic" {
  security_group_id = aws_security_group.nodes.id

  description      = "Allow all outbound traffic"
  type             = "egress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
}

resource "aws_security_group_rule" "ssh" {
  security_group_id = aws_security_group.nodes.id

  description = "Allow SSH access"
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "internal_traffic" {
  security_group_id = aws_security_group.nodes.id

  description = "Allow all internal traffic"
  type        = "ingress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  source_security_group_id = aws_security_group.nodes.id
}

resource "aws_security_group_rule" "other_port" {
  security_group_id = aws_security_group.nodes.id

  description = "Other open port"
  type        = "ingress"
  from_port   = 1234
  to_port     = 1234
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}