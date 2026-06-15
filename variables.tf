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

