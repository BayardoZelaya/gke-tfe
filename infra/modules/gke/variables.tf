variable "vpc_name" {
  description = "VPC Name for GKE Cluster"
}

variable "subnet_name" {
  description = "Subnet Name for GKE Cluster"
}

variable "gke_num_nodes" {
  description = "number of gke nodes"
}

variable "region" {
  description = "gcp region"
}

variable "project_id" {
  description = "project id"
}
