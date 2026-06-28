resource "aws_instance" "ec2" {

    count = 11   #iterate based on index first 0 then 1 then 2 like that 
    ami = var.ami_id
    instance_type = var.instance_names[count.index] == "mongodb" || var.instance_names[count.index] == "shipping" || var.instance_names[count.index] == "mysql" ? "t3.small" : "t3.micro"

    tags = {
        Name = var.instance_names[count.index]
    }
}


resource "aws_route53_record" "route53" {

  count = 11
  zone_id = var.Zone_id
  name    = "${var.instance_names[count.index]}.${var.Domain_name}"
  type    = "A"
  ttl     = 1
  records = [var.instance_names[count.index] == "web" ? aws_instance.ec2[count.index].public_ip : aws_instance.ec2[count.index].private_ip]
}
