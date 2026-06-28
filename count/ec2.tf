resource "aws_instance" "ec2-conditions" {

    count = 3   #iterate based on index first 0 then 1 then 2 like that 
    ami = var.ami_id
    instance_type = "t3.micro"

    tags = {
        Name = var.instance_names[count.index]
    }
}
#creates 3 instances with name called mongodb web and redis 

