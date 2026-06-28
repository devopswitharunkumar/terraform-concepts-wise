variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
  
}

variable "instance_names" {
  type = map(string)
  default = {
    mongodb = "t3.small"
    catalogue = "t3.micro"
    web       = "t3.micro"
    mysql    = "t3.small"     #etc
  }
}


variable "Zone_id" {
    type = string
    default = "Z02149386QBAC23T25TA"
}

variable "Domain_name" {
    type = string
    default = "devopswitharun.online"
}