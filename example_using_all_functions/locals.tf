#In loacls file
locals {
  server_names = keys(var.servers)
  server_types = values(var.servers)
}