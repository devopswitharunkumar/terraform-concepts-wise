resource "aws_instance" "Roboshop_instances" {
  for_each      = local.instance_names[terraform.workspace]
  ami           = data.aws_ami.ami_id_fetch.id
  instance_type = each.value
  tags = {
    Name = "${each.key}-${terraform.workspace}"
  }
}   


resource "aws_route53_record" "Roboshop_Route53_records" {

  for_each = aws_instance.Roboshop_instances
  zone_id = var.Zone_id
  name    = "${each.key}-${terraform.workspace}.${var.Domain_name}"
  type    = "A"
  ttl     = 1
  records = [startswith(each.key, "web") ? each.value.public_ip : each.value.private_ip]
}
