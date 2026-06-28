variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
  
}

variable "instance_names" {
  type = list(string)
  default = ["mongodb", "web", "redis"]
}
