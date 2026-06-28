variable "ingress_rules" {
  default = [{
    description     = "Allowing all inbound port 0"
    from_port       = 0
    to_port         = 0
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  },
  {
    description     = "Allowing all inbound port 22"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  },
  {
    description     = "Allowing all inbound port 443"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  },
  {
    description     = "Allowing all inbound port "
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }]
}