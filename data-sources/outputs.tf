output "zone_id" {
  value = data.aws_route53_zone.zone_id.id
}

output "ami_id" {
  value = data.aws_ami.ami_id_fetch.id
}