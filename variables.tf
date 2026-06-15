# GCP Account set up names

variable "gcp_project_name" {
  default = "buzzcloud-devops"
}

variable "gcp_region" {
  default = "us-east4"
}

variable "gcp_bucket_name" {
  default = "tfe-backend"
}

variable "vpc_subnet_cidr_range" {
  description = "subnet cidr range"
}

variable "node_count" {
  description = "count of gke nodes"
}

variable "argocd_chart_version" {
  type    = string
  default = "9.5.21"
}

variable "subnets" {
  description = "Map of subnet configs"

  type = map(object({
    cidr             = string
    region           = string
    secondary_ranges = optional(map(string), {})
  }))

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
    machine_type = "e2-standard"
    min_count    = 1
    max_count    = 1
    disk_size_gb = 50

    labels = {
      "env" = "dev"
    }
  }]
}
