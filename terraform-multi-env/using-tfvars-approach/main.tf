resource "aws_instance" "multi-env" {
    count = length(var.instance_names)
  ami           = data.aws_ami.ami_id_fetch.id
  instance_type = values(var.instance_names)[count.index]

  tags = {
    Name = keys(var.instance_names)[count.index]
  }
}



resource "aws_route53_record" "Roboshop_Route53_records" {

  count = length(var.instance_names)
  zone_id = data.aws_route53_zone.zone_id.id
  name    = "${keys(var.instance_names)[count.index]}.${var.Domain_name}"
  type    = "A"
  ttl     = 1
  records = [startswith(keys(var.instance_names)[count.index], "web") ? aws_instance.multi-env[count.index].public_ip : aws_instance.multi-env[count.index].private_ip]
}