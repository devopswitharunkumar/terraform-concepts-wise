variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
  
}

variable "instance_names" {
  type = list(string)
  default = ["mongodb", "mysql", "redis", "catalogue"]
}



variable "Zone_id" {
    type = string
    default = "Z02149386QBAC23T25TA"
}

variable "Domain_name" {
    type = string
    default = "devopswitharun.online"
}

variable "project" {
    default = "ROBOSHOP"
}

variable "environment" {
    default = "DEV"
}

variable "servers" {
  default = {
    web = "t3.micro",
    mysql = "t3.small",
    redis = "t3.medium",
    mongodb = "t3.large",
    cart = "t3.xlarge",
  }
}

