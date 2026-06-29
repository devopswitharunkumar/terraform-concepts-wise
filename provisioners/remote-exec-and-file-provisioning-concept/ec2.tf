resource "aws_instance" "ec2-instance" {

    ami = data.aws_ami.ami_id_fetch.id
    instance_type = "t3.micro"
    vpc_security_group_ids = [ aws_security_group.sg_group.id ]
    
    tags = {
      Name = "local-exec-ec2"
    }

    provisioner "local-exec" {
      command = "echo [web] > inventory.ini"
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

   

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    password = "DevOps321"
  }

  provisioner "file" {
    source      = "inventory.ini"
    destination = "/home/ec2-user/inventory.ini"
  }

  provisioner "file" {
  source      = "nginx.yaml"
  destination = "/home/ec2-user/nginx.yaml"
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo dnf install ansible -y",
      "ansible-playbook -i inventory.ini /home/ec2-user/nginx.yaml"
     ]
  }


}

resource "aws_security_group" "sg_group" {
  name   = "sg"
  description = "Allowing inbound andoutobund ports"
  ingress {
    description     = "allow inbound ports"
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }


  egress {
    description     = "allow outbound ports"
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "remote-exec-sg"
  }
}

