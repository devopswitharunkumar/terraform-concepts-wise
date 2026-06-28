output "CreatedTime" {
  value = timestamp()
}

output "server_names" {
  value = keys(var.servers)
}

output "server_types" {
  value = values(var.servers)
}

# In loacls file
# locals {
#   server_names = keys(var.servers)
#   server_types = values(var.servers)
# }


