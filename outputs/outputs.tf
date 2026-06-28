output "ec2-total-info" {
  value = aws_instance.ec2-conditions    #print total info about ec2
} 

output "public_ip" {
  value = aws_instance.ec2-conditions.public_ip
}

output "private_ip" {
  value = aws_instance.ec2-conditions.private_ip
}


output "instance-id" {
  value = aws_instance.ec2-conditions.id
}

output "ami-id" {
  value = aws_instance.ec2-conditions.ami
}