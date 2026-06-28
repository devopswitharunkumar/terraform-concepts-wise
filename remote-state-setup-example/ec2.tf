resource "aws_instance" "ec2-instance" {

    ami = data.aws_ami.ami_id_fetch.id
    instance_type = var.instance_type
    # vpc_security_group_ids = [aws_security_group.sg_group.id]           #security group is optional and it takes default SG

    tags = {
      Name = "remote-state-setup"
    }
}