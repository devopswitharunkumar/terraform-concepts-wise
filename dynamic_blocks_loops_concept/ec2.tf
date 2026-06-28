resource "aws_instance" "ec2" {

    ami = data.aws_ami.ami_id_fetch.id
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.sg_group.id]

    tags = {
        Name = "dynamic-block-example"
    }
}


resource "aws_security_group" "sg_group" {
  name   = "sg"
  description = "Allowing inbound andoutobund ports"
  #if i want to create multiple ports enable i have to repeat same code for multiple times for 80,22,443,
#   ingress {
#     description     = "Allowing all inbound port 0"
#     from_port       = 0
#     to_port         = 0
#     protocol        = "tcp"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   ingress {
#     description     = "Allowing all inbound port 22"
#     from_port       = 22
#     to_port         = 22
#     protocol        = "tcp"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   ingress {
#     description     = "Allowing all inbound port 443"
#     from_port       = 443
#     to_port         = 443
#     protocol        = "tcp"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

  #instead of writing like this we can use dynamic block with single block and pass port numbers dynamically like loop


    dynamic "ingress" {
      for_each = var.ingress_rules
      content {
        description = ingress.value["description"]
        from_port = ingress.value["from_port"]
        to_port = ingress.value["to_port"]
        protocol = ingress.value["protocol"]
        cidr_blocks = ingress.value["cidr_blocks"]
      }
    }


  egress {
    description     = "Allowing all outbount ports"
    from_port       = 0
    to_port         = 0
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Variables-sg"
  }
}