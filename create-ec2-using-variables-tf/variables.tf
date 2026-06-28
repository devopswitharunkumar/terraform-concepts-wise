variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
  
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "from_port" {
  type = number
  default = 0
}


variable "to_port" {
  type = number
  default = 0
}

variable "cidr_blocks" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}

variable "description" {
  type = string
  default = "Allowing all ports"
}