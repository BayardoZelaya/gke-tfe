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
