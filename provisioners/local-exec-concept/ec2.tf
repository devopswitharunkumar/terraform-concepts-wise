resource "aws_instance" "ec2-instance" {

    ami = data.aws_ami.ami_id_fetch.id
    instance_type = "t3.micro"
    
    tags = {
      Name = "local-exec-ec2"
    }

    provisioner "local-exec" {
      command = "echo ec2 created "
    }

    provisioner "local-exec" {
      command = "echo [web] > inventory.ini "
    }
    
  
    provisioner "local-exec" {
    command = "echo ${self.public_ip} >> inventory.ini"
    }

    provisioner "local-exec" {
    command = "echo. >> inventory.ini"
    }

    provisioner "local-exec" {
    command = "echo [web:vars] >> inventory.ini"
    }

    provisioner "local-exec" {
    command = "echo ansible_user=ec2-user >> inventory.ini"
    }

    provisioner "local-exec" {
    command = "echo ansible_password=DevOps321 >> inventory.ini"
    }

    provisioner "local-exec" {
		command = "echo trigger ansible"
        # command = "ansible-playbook -i inventory nginx.yml" #u will get error here not recognised becasue ansible not installed in local machine 
    }


}

