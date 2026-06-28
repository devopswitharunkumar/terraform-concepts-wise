resource "aws_instance" "ec2" {

    count = length(var.instance_names) 
    ami = var.ami_id
    instance_type = var.instance_names[count.index] == "mongodb" || var.instance_names[count.index] == "shipping" || var.instance_names[count.index] == "mysql" ? "t3.small" : "t3.micro"

    tags = {      
        Name = upper(var.instance_names[count.index])
        environment = lower(join("-", [var.project, var.environment])) 
        Replace_environment =  replace(join("-", [var.project, var.environment]), var.environment, "prod")   
        split_function = join("-", split(",", "roboshop,project,environment"))

        calculate_max = max(10,20,19)
        calculate_min = min(10,20,19)
        contains_check = contains(["dev","prod"], "dev")
        element_check = element(["dev","prod"],0)

#AWS tags expect Key = String it doesnt accept list map etc 
        #  CreatedTime = local.time
        #does not work it returns list so joined keys(var.servers)
        # map_functions_keys = join("-", keys(var.servers))  #using locals file and outputs file  
        # map_functions_values = join("-", values(var.servers))

        lookup_func = lookup(var.servers, "web")    #if web is not present in variables map it will throw error
        lookup_func_with_default_value = lookup(var.servers, "payment", "t3.large")   #if payment key is not there in map it will give default valeu mentioned here  t3.large
        encode_function = jsonencode({
                            project = "roboshop"
                            env = "prod"})  #after apply it store like encode_function = {"env":"prod","project":"roboshop"}
        base64_func =  base64encode("Arun")
    }
}


resource "aws_route53_record" "route53" {

  count = length(var.instance_names) 
  zone_id = var.Zone_id
  name    = "${var.instance_names[count.index]}.${var.Domain_name}"
  type    = "A"
  ttl     = 1
  records = [var.instance_names[count.index] == "web" ? aws_instance.ec2[count.index].public_ip : aws_instance.ec2[count.index].private_ip]
}
