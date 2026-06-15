locals {
  subnet_regions = toset([for s in var.subnets : s.region])

  vpc_name = "${var.project_id}-vpc"
}
