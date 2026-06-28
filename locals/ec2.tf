resource "aws_instance" "ec2-conditions" {
    
     count = length(var.Roboshop_instance_names)
    ami = var.ami_id
    # instance_type = "t3.micro"
     instance_type = lookup(
    local.instance_types,
    var.Roboshop_instance_names[count.index],
    "t3.micro"                 #  a default this is a default value
 )

    tags = {
        name = local.name
    }
}


