
variable "instance_names" {
  type = list(string)
  default = ["mongodb", "catalogue", "shipping", "web"]
}

variable "Domain_name" {
    type = string
    default = "devopswitharun.online"
}