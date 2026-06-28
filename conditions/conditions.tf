resource "aws_instance" "ec2-conditions" {
    ami = var.ami_id
    instance_type = var.instance_type == "dev" ? "t3.micro" : "t3.small"
}


