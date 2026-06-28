variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
  
}

variable "instance_names" {
  type = list(string)
  default = ["mongodb", "mysql", "redis", "rabbitmq", "catalogue", "cart", "user", "shipping", "payment", "web", "dispatch"]
}



variable "Zone_id" {
    type = string
    default = "Z02149386QBAC23T25TA"
}

variable "Domain_name" {
    type = string
    default = "devopswitharun.online"
}