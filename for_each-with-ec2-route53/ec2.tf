resource "aws_instance" "ec2" {

    for_each = var.instance_names
    ami = var.ami_id
    instance_type = each.value
    tags = {
        Name = each.key
    }
}


resource "aws_route53_record" "route53" {

  for_each = var.instance_names
  zone_id = var.Zone_id
  name    = "${each.key}.${var.Domain_name}"
  type    = "A"
  ttl     = 1
  records = [each.key == "web" ? aws_instance.ec2[each.key].public_ip : aws_instance.ec2[each.key].private_ip]
}

#above method or below method we can use
#for_each = aws_instance.ec2
#records = [each.key == "web" ? each.value.public_ip : each.value.private_ip]