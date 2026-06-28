locals {
  name = "${var.project}-${var.env}"
}

locals {
 instance_types = {
   mongodb = "t3.small"
   mysql = "t3.small"
   shipping = "t3.small"
 }

}