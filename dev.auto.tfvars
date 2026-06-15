vpc_subnet_cidr_range = "10.10.0.0/24"

node_count = 1

subnets = {
  "platform" = {
    cidr = "10.10.0.0/24", region = "us-east4"
  }
}

node_pools = [{
  name         = "general"
  machine_type = "e2-medium"
  node_count   = 1
  disk_size_gb = 50
  disk_type    = "pd-standard"

  labels = {
    "env" = "dev"
  }

  taints = [{
    key = "dedicated", value = "platform", effect = "NO_SCHEDULE"
  }]
}]
