variable "vpc_name" {
  description = "VPC Name for GKE Cluster"
}

variable "subnet_name" {
  description = "Subnet Name for GKE Cluster"
}

variable "region" {
  description = "gcp region"
}

variable "project_id" {
  description = "project id"
}

variable "node_pools" {
  type = list(object({
    name         = string
    machine_type = string
    node_count   = optional(number, 1)
    disk_size_gb = optional(number, 50)
    disk_type    = optional(string, "pd-standard")

    labels = optional(map(string), {})
    taints = optional(list(object({
      key    = string
      value  = string
      effect = string
    })), [])
  }))
  default = [{
    name         = "general"
    machine_type = "e2-medium"
    node_count   = 1
    disk_size_gb = 50

    labels = {
      "env" = "dev"
    }
  }]
}
