resource "aws_security_group" "sg_group" {
  name   = var.sg_name
  description = "Allowing inbound andoutobund ports"
  ingress {
    description     = var.description
    from_port       = var.from_port
    to_port         = var.to_port
    protocol        = "tcp"
    cidr_blocks     = var.cidr_blocks
  }

  egress {
    description     = var.description
    from_port       = var.from_port
    to_port         = var.to_port
    protocol        = "tcp"
    cidr_blocks     = var.cidr_blocks
  }
  tags = var.tags
}