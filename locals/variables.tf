variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
  
}
variable "project" {
  default = "roboshop"  
}

variable "env" {
  default = "dev"  
}

variable "Roboshop_instance_names" {
  default = ["mongodb", "mysql", "shipping"]
}

